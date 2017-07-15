require "test_helper"

class WebhookTest < Minitest::Test
  include Helpers

  def verify_response(expected, webhook)
    assert webhook.is_a?(ProsperWorks::Webhook)
    assert_equal expected[:id], webhook.id
    assert_equal expected.keys.length, webhook.instance_variables.length

    expected.each do |key, value|
      next if value.is_a?(Enumerable)
      if value.nil?
        assert_nil webhook.send(key)
      else
        assert_equal value, webhook.send(key)
      end
    end   
  end

  def setup
    @id = webhook_details[:id]
    @single_resource_url = get_uri(ProsperWorks::Webhook.api_name, @id)
    @list_url = get_uri(ProsperWorks::Webhook.api_name)
  end

  def test_webhook_get
    stub_request(:get, @single_resource_url).with(headers: headers).to_return(status: 200, body: webhook_payload)

    webhook = ProsperWorks::Webhook.find(@id)

    verify_response(webhook_details, webhook)
  end
  

  def test_webhook_list
    multiple_webhooks = [
      {
        id: 800,
        target: "https://myserver.net",
        event: "new",
        type: "lead",
        secret: { key_a: "value_a" }
      },
      {
        id: 803,
        target: "https://anotherserver.net",
        event: "update",
        type: "task",
        secret: nil
      },
    ]
    stub_request(:get, @list_url).with(headers: headers).to_return(status: 200, body: JSON.generate(multiple_webhooks))

    webhooks = ProsperWorks::Webhook.list

    webhooks.each_with_index do |webhook, i|
      verify_response(multiple_webhooks[i], webhook)
    end
  end

end
