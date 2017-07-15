require "test_helper"

class DeleteTest < Minitest::Test
  include Helpers  

  def delete_response_handles_errors
    id = 2
    url = get_uri(ProsperWorks::Contact.api_name, id)
    stub_request(:delete, url).with(headers: headers).to_return(status: 404, body: "")

    assert_equal Errors::Unprocessable, ProsperWorks::Contact.delete(id)
  end

end
