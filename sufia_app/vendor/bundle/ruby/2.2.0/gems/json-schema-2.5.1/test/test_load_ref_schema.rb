require File.expand_path('../test_helper', __FILE__)

class LoadRefSchemaTests < Minitest::Test
  def load_other_schema
    JSON::Validator.add_schema(JSON::Schema.new(
      {
        '$schema' => 'http://json-schema.org/draft-04/schema#',
        'type' => 'object',
        'properties' => {
          "title" => {
            "type" => "string"
          }
        }
      },
      Addressable::URI.parse("http://example.com/schema#")
    ))
  end

  def test_cached_schema
    schema_url = "http://example.com/schema#"
    schema = {
      "$ref" => schema_url
    }
    data = {}
    load_other_schema
    validator = JSON::Validator.new(schema, data)
    assert JSON::Validator.schema_loaded?(schema_url)
  end

  def test_cached_schema_with_fragment
    schema_url = "http://example.com/schema#"
    schema = {
      "$ref" => "#{schema_url}/properties/title"
    }
    data = {}
    load_other_schema
    validator = JSON::Validator.new(schema, data)
    assert JSON::Validator.schema_loaded?(schema_url)
  end
end
