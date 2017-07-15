require "test_helper"

class LeadTest < Minitest::Test
  include Helpers

  def verify_response(expected, lead)
    assert lead.is_a?(ProsperWorks::Lead)
    assert_equal @id, lead.id
    assert_equal expected.keys.length, lead.instance_variables.length

    expected.each do |key, value|
      next if value.is_a?(Enumerable)
      if value.nil?
        assert_nil lead.send(key)
      else
        assert_equal value, lead.send(key)
      end
    end
  end

  def setup
    @id = lead_details[:id]
    @single_resource_url = get_uri(ProsperWorks::Lead.api_name, @id)
    @create_url = get_uri(ProsperWorks::Lead.api_name)
  end

  def test_lead_get
    stub_request(:get, @single_resource_url).with(headers: headers).to_return(status: 200, body: lead_payload)

    lead = ProsperWorks::Lead.find(@id)
    verify_response(lead_details, lead)
  end

  def test_lead_create
    stub_request(:post, @create_url).with(headers: headers).to_return(status: 200, body: lead_payload)

    lead = ProsperWorks::Lead.create(lead_details)
    verify_response(lead_details, lead)
  end

  def test_lead_update
    stub_request(:put, @single_resource_url).with(headers: headers).to_return(status: 200, body: lead_payload)

    initial_attributes = {
      id: @id,
      name: "some initial name",
      title: "Thinker"
    }

    lead = ProsperWorks::Lead.new(initial_attributes)
    assert_equal initial_attributes[:name], lead.name
    assert_equal initial_attributes[:title], lead.title

    response = ProsperWorks::Lead.update(lead, lead_details)
    verify_response(lead_details, lead)
  end

  def test_lead_delete
    delete_payload = JSON.generate({
      id: @id,
      is_deleted: true
    })
    stub_request(:delete, @single_resource_url).with(headers: headers).to_return(status: 200, body: delete_payload)

    lead = ProsperWorks::Lead.new(lead_details)
    response = ProsperWorks::Lead.delete(lead.id)

    expected_result = {
      "id" => lead.id,
      "is_deleted" => true
    }
    assert_equal expected_result, response
  end

end
