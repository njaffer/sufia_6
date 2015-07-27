require 'spec_helper'

describe Ldp::Response do
  LDP_RDF_RESOURCE_HEADERS = { "Link" => "<#{Ldp.resource.to_s}>;rel=\"type\", <#{Ldp.direct_container.to_s}>;rel=\"type\""}
  LDP_NON_RDF_SOURCE_HEADERS = { "Link" => "<#{Ldp.resource.to_s}>;rel=\"type\", <#{Ldp.non_rdf_source.to_s}>;rel=\"type\""}

  let(:mock_response) { double("mock response", headers: {}, env: { url: "info:a" }) }
  let(:mock_client) { double(Ldp::Client) }

  subject do
    Ldp::Response.wrap mock_client, mock_response
  end

  describe ".wrap" do
    it "should mixin Ldp::Response into the raw response" do
      Ldp::Response.wrap(mock_client, mock_response)
      expect(mock_response).to be_a_kind_of(Ldp::Response)
    end
  end

  describe "#dup" do
    let(:mock_conn) { Faraday.new { |builder| builder.adapter :test, conn_stubs } }
    let(:client) { Ldp::Client.new mock_conn }
    let(:raw_response) { client.get "a_container" }
    let(:conn_stubs) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get('/a_container') { [200, {"Link" => link}, body] }
      end
    end
    let(:response) { Ldp::Response.wrap mock_client, raw_response }

    subject { response.dup }

    context "for a container resource" do
      let(:body) { "<> a <http://www.w3.org/ns/ldp#Container> ." }
      let(:link) { ["<http://www.w3.org/ns/ldp#Resource>;rel=\"type\"","<http://www.w3.org/ns/ldp#BasicContainer>;rel=\"type\""] }
      it { is_expected.to respond_to :links }

      it "should not have duplicated the graph" do
        expect(response.graph.object_id).not_to eq subject.graph.object_id
      end

      it "should have duplicated the body" do
        expect(response.body.object_id).to eq subject.body.object_id
      end
    end

    context "for a non-rdf resource" do
      let(:body) { "This is only a test" }
      let(:link) { ["<http://www.w3.org/ns/ldp#Resource>;rel=\"type\"","<http://www.w3.org/ns/ldp#NonRDFSource>;rel=\"type\""] }
      it { is_expected.to respond_to :links }

      it "should not have a graph" do
        expect(response.instance_variable_get(:@graph)).to be_nil
      end

      it "should have duplicated the body" do
        expect(response.body.object_id).to eq subject.body.object_id
      end
    end
  end


  describe ".links" do
    it "should extract link headers with relations as a hash" do
      allow(mock_response).to receive(:headers).and_return(
        "Link" => [
            "<xyz>;rel=\"some-rel\"",
            "<abc>;rel=\"some-multi-rel\"",
            "<123>;rel=\"some-multi-rel\"",
            "<vanilla-link>"
          ]
        )
      h = Ldp::Response.links mock_response

      expect(h['some-rel']).to include("xyz")
      expect(h['some-multi-rel']).to include("abc", "123")
      expect(h['doesnt-exist']).to be_nil
    end

    it "should return an empty hash if no link headers are availabe" do
      allow(mock_response).to receive(:headers).and_return({})
      h = Ldp::Response.links mock_response

      expect(h).to be_empty
    end

  end

  describe ".resource?" do
    it "should be a resource if a Link[rel=type] header asserts it is an ldp:resource" do
      allow(mock_response).to receive(:headers).and_return(
        "Link" => [
            "<#{Ldp.resource}>;rel=\"type\""
          ]
        )
      expect(Ldp::Response.resource? mock_response).to be true
    end
  end

  describe "#graph" do
    context "for an RDFSource (or Container)" do
      it "should parse the response body for an RDF graph" do
        allow(mock_response).to receive(:body).and_return("<> <info:b> <info:c> .")
        allow(mock_response).to receive(:headers).and_return(LDP_RDF_RESOURCE_HEADERS)
        graph = subject.graph

        expect(graph).to have_subject(RDF::URI.new("info:a"))
        expect(graph).to have_statement RDF::Statement.new(RDF::URI.new("info:a"), RDF::URI.new("info:b"), RDF::URI.new("info:c"))
      end
    end

    context "for a NonRDFSource" do
      it "should parse the response body for an RDF graph" do
        allow(mock_response).to receive(:body).and_return("<> <info:b> <info:c> .")
        allow(mock_response).to receive(:headers).and_return(LDP_NON_RDF_SOURCE_HEADERS)
        expect { subject.graph }.to raise_error Ldp::UnexpectedContentType
      end
    end
  end

  describe "#etag" do
    it "should pass through the response's ETag" do
      allow(mock_response).to receive(:headers).and_return('ETag' => 'xyz')

      expect(subject.etag).to eq('xyz')
    end
  end

  describe "#last_modified" do
    it "should pass through the response's Last-Modified" do
      allow(mock_response).to receive(:headers).and_return('Last-Modified' => 'some-date')
      expect(subject.last_modified).to eq('some-date')
    end
  end

  describe "#has_page?" do
    context "for an RDF Source" do
      before do
        allow(mock_response).to receive(:headers).and_return(LDP_RDF_RESOURCE_HEADERS)
      end

      it "should see if the response has an ldp:Page statement" do
        graph = RDF::Graph.new
        graph << [RDF::URI.new('info:a'), RDF.type, Ldp.page]
        allow(mock_response).to receive(:body).and_return(graph.dump(:ttl))
        expect(subject).to have_page
      end

      it "should be false otherwise" do
        # allow(subject).to receive(:page_subject).and_return RDF::URI.new('info:a')
        graph = RDF::Graph.new
        allow(mock_response).to receive(:body).and_return(graph.dump(:ttl))
        expect(subject).not_to have_page
      end
    end

    context "with a non-rdf-source" do
      it "should be false" do
        # allow(subject).to receive(:page_subject).and_return RDF::URI.new('info:a')
        # allow(mock_response).to receive(:body).and_return('')
        allow(mock_response).to receive(:headers).and_return(LDP_NON_RDF_SOURCE_HEADERS)
        expect(subject).not_to have_page
      end
    end
  end

  describe "#page" do
    it "should get the ldp:Page data from the query" do
      graph = RDF::Graph.new

      graph << [RDF::URI.new('info:a'), RDF.type, Ldp.page]
      graph << [RDF::URI.new('info:b'), RDF.type, Ldp.page]

      allow(mock_response).to receive(:body).and_return(graph.dump(:ttl))
      allow(mock_response).to receive(:headers).and_return(LDP_RDF_RESOURCE_HEADERS)

      expect(subject.page.count).to eq(1)
    end
  end

  describe "#subject" do
    it "should extract the HTTP request URI as an RDF URI" do
      allow(mock_response).to receive(:body).and_return('')
      allow(mock_response).to receive(:headers).and_return(LDP_RDF_RESOURCE_HEADERS)
      allow(mock_response).to receive(:env).and_return(:url => 'http://xyz/a')
      expect(subject.subject).to eq(RDF::URI.new("http://xyz/a"))
    end
  end
end
