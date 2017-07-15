require "test_helper"

class ConnectTest < Minitest::Test
  include Helpers  

  def test_get_uri
    # get_uri is aliased in Helpers
    uri = get_uri("test_api", 14)

    assert_equal "https://api.prosperworks.com/developer_api/v1/test_api/14", uri.to_s
  end
  
  def bad_request_response
    id = 2
    url = get_uri(ProsperWorks::Contact.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 400, body: "")

    assert_equal Errors::BadRequest, ProsperWorks::Contact.find(id)
  end

  def forbidden_response
    id = 2
    url = get_uri(ProsperWorks::Contact.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 401, body: "")

    assert_equal Errors::Forbidden, ProsperWorks::Contact.find(id)
  end

  def not_found_response
    id = 2
    url = get_uri(ProsperWorks::Contact.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 404, body: "")

    assert_equal Errors::NotFound, ProsperWorks::Contact.find(id)
  end

  def rate_limit_response
    id = 2
    url = get_uri(ProsperWorks::Contact.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 429, body: "")

    assert_equal Errors::RateLimit, ProsperWorks::Contact.find(id)
  end

  def server_error_response
    id = 2
    url = get_uri(ProsperWorks::Contact.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 500, body: "")

    assert_equal Errors::ServerError, ProsperWorks::Contact.find(id)
  end

  def unauthorized_response
    id = 2
    url = get_uri(ProsperWorks::Contact.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 401, body: "")

    assert_equal Errors::Unauthorized, ProsperWorks::Contact.find(id)
  end

  def unprocessable_response
    id = 2
    url = get_uri(ProsperWorks::Contact.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 429, body: "")

    assert_equal Errors::Unprocessable, ProsperWorks::Contact.find(id)
  end

end
