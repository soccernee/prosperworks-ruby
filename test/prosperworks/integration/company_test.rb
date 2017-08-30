require "test_helper"

class CompanyTest < Minitest::Test
  include Helpers

  def verify_response(expected, company)
    assert company.is_a?(ProsperWorks::Company)
    assert_equal expected[:id], company.id
    assert_equal expected.keys.length, company.instance_variables.length

    expected.each do |key, value|
      next if value.is_a?(Enumerable)
      if value.nil?
        assert_nil company.send(key)
      else
        assert_equal value, company.send(key)
      end
    end
  end

  def setup
    @id = company_details[:id]
    @single_resource_url = get_uri(ProsperWorks::Company.api_name, @id)
    @create_url = get_uri(ProsperWorks::Company.api_name)
    @search_url = get_uri(ProsperWorks::Company.api_name, 'search')
  end

  def test_company_get
    stub_request(:get, @single_resource_url).with(headers: headers).to_return(status: 200, body: company_payload)

    company = ProsperWorks::Company.find(@id)
    verify_response(company_details, company)
  end

  def test_company_search
    stub_request(:post, @search_url).with(headers: headers)
                                    .to_return(status: 200, body: company_search_results_payload)

    companies = ProsperWorks::Company.search
    company_search_result_details.zip(companies).each do |company_details, company|
      verify_response(company_details, company)
    end
  end

  def test_company_create
    stub_request(:post, @create_url).with(headers: headers).to_return(status: 200, body: company_payload)

    company = ProsperWorks::Company.create(company_details)
    verify_response(company_details, company)
  end

  def test_company_update
    stub_request(:put, @single_resource_url).with(headers: headers).to_return(status: 200, body: company_payload)

    initial_attributes = {
      id: @id,
      name: "some initial name"
    }

    company = ProsperWorks::Company.new(initial_attributes)
    assert_equal initial_attributes[:name], company.name

    response = ProsperWorks::Company.update(company, company_details)
    verify_response(company_details, company)
  end

  def test_company_delete
    delete_payload = JSON.generate({
      id: @id,
      is_deleted: true
    })
    stub_request(:delete, @single_resource_url).with(headers: headers).to_return(status: 200, body: delete_payload)

    company = ProsperWorks::Company.new(company_details)
    response = ProsperWorks::Company.delete(company.id)

    expected_result = {
      "id" => company.id,
      "is_deleted" => true
    }
    assert_equal expected_result, response
  end

end
