require "test_helper"

class TaskTest < Minitest::Test
  include Helpers

  def verify_response(expected, task)
    assert task.is_a?(ProsperWorks::Task)
    assert_equal @id, task.id
    assert_equal expected.keys.length, task.instance_variables.length

    expected.each do |key, value|
      next if value.is_a?(Enumerable)
      if value.nil?
        assert_nil task.send(key)
      else
        assert_equal value, task.send(key)
      end
    end
  end

  def setup
    @id = task_details[:id]
    @single_resource_url = get_uri(ProsperWorks::Task.api_name, @id)
    @create_url = get_uri(ProsperWorks::Task.api_name)
  end

  def test_task_get
    stub_request(:get, @single_resource_url).with(headers: headers).to_return(status: 200, body: task_payload)

    task = ProsperWorks::Task.find(@id)
    verify_response(task_details, task)
  end

  def test_task_create
    stub_request(:post, @create_url).with(headers: headers).to_return(status: 200, body: task_payload)

    task = ProsperWorks::Task.create(task_details)
    verify_response(task_details, task)
  end

  def test_task_update
    stub_request(:put, @single_resource_url).with(headers: headers).to_return(status: 200, body: task_payload)

    initial_attributes = {
      id: @id,
      name: "some initial name"
    }

    task = ProsperWorks::Task.new(initial_attributes)
    assert_equal initial_attributes[:name], task.name

    response = ProsperWorks::Task.update(task, task_details)
    verify_response(task_details, task)
  end

  def test_task_delete
    delete_payload = JSON.generate({
      id: @id,
      is_deleted: true
    })
    stub_request(:delete, @single_resource_url).with(headers: headers).to_return(status: 200, body: delete_payload)

    task = ProsperWorks::Task.new(task_details)
    response = ProsperWorks::Task.delete(task.id)

    expected_result = {
      "id" => task.id,
      "is_deleted" => true
    }
    assert_equal expected_result, response
  end

end
