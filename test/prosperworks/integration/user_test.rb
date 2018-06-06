require "test_helper"

class UserTest < Minitest::Test
  include Helpers

  def verify_response(expected, user)
    assert user.is_a?(ProsperWorks::User)
    assert_equal expected[:id], user.id
    assert_equal expected.keys.length, user.instance_variables.length

    expected.each do |key, value|
      next if value.is_a?(Enumerable)
      if value.nil?
        assert_nil user.send(key)
      else
        assert_equal value, user.send(key)
      end
    end
  end

  def setup
    @id = user_details[:id]
    @single_resource_url = get_uri(ProsperWorks::Webhook.api_name, @id)
    @create_url = get_uri(ProsperWorks::User.api_name)
  end

  def test_user_get
    stub_request(:get, @single_resource_url).with(headers: headers).to_return(status: 200, body: user_payload)

    user = ProsperWorks::User.find(@id)
    verify_response(user_details, user)
  end

  def test_user_create
    stub_request(:post, @create_url).with(headers: headers).to_return(status: 200, body: user_payload)

    user = ProsperWorks::User.create(user_details)
    verify_response(user_details, user)
  end

  def test_user_update
    stub_request(:put, @single_resource_url).with(headers: headers).to_return(status: 200, body: user_payload)

    initial_attributes = {
      id: @id,
      username: "some initial username",
      email: "something@gmail.com"
    }

    user = ProsperWorks::User.new(initial_attributes)
    assert_equal initial_attributes[:username], user.username
    assert_equal initial_attributes[:email], user.email

    response = ProsperWorks::User.update(user, user_details)
    verify_response(user_details, user)
  end

  def test_user_delete
    delete_payload = JSON.generate({
      id: @id,
      is_deleted: true
    })
    stub_request(:delete, @single_resource_url).with(headers: headers).to_return(status: 200, body: delete_payload)

    user = ProsperWorks::User.new(user_details)
    response = ProsperWorks::User.delete(user.id)

    expected_result = {
      "id" => user.id,
      "is_deleted" => true
    }
    assert_equal expected_result, response
  end

end
