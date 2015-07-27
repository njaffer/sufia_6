require 'spec_helper'

describe Admin::StatsController, type: :controller do
  let(:user1) { FactoryGirl.find_or_create(:user) }
  let(:user2) { FactoryGirl.find_or_create(:archivist) }
  
  before do
    allow(user1).to receive(:groups).and_return(['admin'])
    allow(user2).to receive(:groups).and_return(['not-admin'])
  end

  describe "statistics page" do
    render_views
    before do
      sign_in user1
    end

    it 'allows an authorized user to view the page' do
      get :index
      expect(response).to be_success
      expect(response.body).to include('Statistics for Blacklight')
      expect(response.body).to include('Total Blacklight Users')
    end

    describe "querying user_stats" do
      let(:one_day_ago_date) { 1.days.ago.to_datetime }
      let(:two_days_ago_date) { 2.days.ago.to_datetime.end_of_day }
      let(:one_day_ago) { one_day_ago_date.strftime("%Y-%m-%d") }
      let(:two_days_ago) { two_days_ago_date.strftime("%Y-%m-%d") }

      it "defaults to latest 5 users" do
        get :index
        expect(assigns[:recent_users]).to eq(User.order('created_at DESC').limit(5))
      end
      it "allows queries against user_stats without an end date " do
        expect(User).to receive(:where).with('id' => user1.id).once.and_return([user1])
        expect(User).to receive(:recent_users).with(one_day_ago_date, nil).and_return([user2])
        get :index, users_stats: { start_date: one_day_ago }
        expect(assigns[:recent_users]).to eq([user2])
      end
      it "allows queries against user_stats with an end date" do
        expect(User).to receive(:recent_users).with(two_days_ago_date, one_day_ago_date).and_return([user2])
        get :index, users_stats: { start_date: two_days_ago, end_date: one_day_ago }
        expect(assigns[:recent_users]).to eq([user2])
      end
    end

    describe "files_count" do
      let(:original_files_count) do
        poltergeist = GenericFile.new
        poltergeist.apply_depositor_metadata(user1)
        poltergeist.save
        original_files_count = GenericFile.count
        ActiveFedora::SolrService.instance.conn.delete_by_id(poltergeist.id)
        original_files_count
      end
      it "should provide accurate files_count, ensuring that solr deletes have been expunged first" do
        get :index
        expect(assigns[:files_count][:total]).to eq(original_files_count - 1)
      end
    end

    describe "counts" do
      context "when date range not set" do
        before do
          FactoryGirl.create(:generic_file, depositor: user1)
          FactoryGirl.create(:public_file, depositor: user1)
          FactoryGirl.create(:registered_file, depositor: user1)
          Collection.create(title: "test") do |c|
            c.apply_depositor_metadata(user1.user_key)
          end
        end
        it "includes files but not collections" do
          get :index
          expect(assigns[:files_count][:total]).to eq(3)
          expect(assigns[:files_count][:public]).to eq(1)
          expect(assigns[:files_count][:registered]).to eq(1)
          expect(assigns[:files_count][:private]).to eq(1)
        end
      end

      context "when start date set" do
        it "queries by start date" do
          expect(GenericFile).to receive(:find_by_date_created).exactly(3).times.with(1.days.ago.to_datetime, nil).and_call_original
          expect(GenericFile).to receive(:where_public).and_call_original
          expect(GenericFile).to receive(:where_registered).and_call_original
          get :index, users_stats: { file_start_date: 1.days.ago.strftime("%Y-%m-%d") }
        end
      end

      context "when date range set" do
        it "queries by start and date" do
          expect(GenericFile).to receive(:find_by_date_created).exactly(3).times.with(1.days.ago.to_datetime, 0.days.ago.to_datetime.end_of_day).and_call_original
          expect(GenericFile).to receive(:where_public).and_call_original
          expect(GenericFile).to receive(:where_registered).and_call_original
          get :index, users_stats: { file_start_date: 1.days.ago.strftime("%Y-%m-%d"), file_end_date: 0.days.ago.strftime("%Y-%m-%d") }
        end
      end
    end

  end
end
