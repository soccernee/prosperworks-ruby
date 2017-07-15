require "test_helper"

class OpportunityTest < Minitest::Test
  include Helpers

  def verify_response(expected, opportunity)
    assert opportunity.is_a?(ProsperWorks::Opportunity)
    assert_equal @id, opportunity.id
    assert_equal expected.keys.length, opportunity.instance_variables.length

    expected.each do |key, value|
      next if value.is_a?(Enumerable)
      if value.nil?
        assert_nil opportunity.send(key)
      else
        assert_equal value, opportunity.send(key)
      end
    end
  end

  def setup
    @id = opportunity_details[:id]
    @single_resource_url = get_uri(ProsperWorks::Opportunity.api_name, @id)
    @create_url = get_uri(ProsperWorks::Opportunity.api_name)
  end

  def test_opportunity_get
    stub_request(:get, @single_resource_url).with(headers: headers).to_return(status: 200, body: opportunity_payload)

    opportunity = ProsperWorks::Opportunity.find(@id)
    verify_response(opportunity_details, opportunity)
  end

  def test_opportunity_create
    stub_request(:post, @create_url).with(headers: headers).to_return(status: 200, body: opportunity_payload)

    opportunity = ProsperWorks::Opportunity.create(opportunity_details)
    verify_response(opportunity_details, opportunity)
  end

  def test_opportunity_update
    stub_request(:put, @single_resource_url).with(headers: headers).to_return(status: 200, body: opportunity_payload)

    initial_attributes = {
      id: @id,
      name: "some initial name",
      pipeline_id: 1_501
    }

    opportunity = ProsperWorks::Opportunity.new(initial_attributes)
    assert_equal initial_attributes[:name], opportunity.name
    assert_equal initial_attributes[:pipeline_id], opportunity.pipeline_id

    response = ProsperWorks::Opportunity.update(opportunity, opportunity_details)
    verify_response(opportunity_details, opportunity)
  end

  def test_opportunity_delete
    delete_payload = JSON.generate({
      id: @id,
      is_deleted: true
    })
    stub_request(:delete, @single_resource_url).with(headers: headers).to_return(status: 200, body: delete_payload)

    opportunity = ProsperWorks::Opportunity.new(opportunity_details)
    response = ProsperWorks::Opportunity.delete(opportunity.id)

    expected_result = {
      "id" => opportunity.id,
      "is_deleted" => true
    }
    assert_equal expected_result, response
  end

end
