require "test_helper"

class ProjectTest < Minitest::Test
  include Helpers

  def verify_response(expected, project)
    assert project.is_a?(ProsperWorks::Project)
    assert_equal @id, project.id
    assert_equal expected.keys.length, project.instance_variables.length

    expected.each do |key, value|
      next if value.is_a?(Enumerable)
      if value.nil?
        assert_nil project.send(key)
      else
        assert_equal value, project.send(key)
      end
    end
  end

  def setup
    @id = project_details[:id]
    @single_resource_url = get_uri(ProsperWorks::Project.api_name, @id)
    @create_url = get_uri(ProsperWorks::Project.api_name)
  end

  def test_project_get
    stub_request(:get, @single_resource_url).with(headers: headers).to_return(status: 200, body: project_payload)

    project = ProsperWorks::Project.find(@id)
    verify_response(project_details, project)
  end

  def test_project_create
    stub_request(:post, @create_url).with(headers: headers).to_return(status: 200, body: project_payload)

    project = ProsperWorks::Project.create(project_details)
    verify_response(project_details, project)
  end

  def test_project_update
    stub_request(:put, @single_resource_url).with(headers: headers).to_return(status: 200, body: project_payload)

    initial_attributes = {
      id: @id,
      name: "some initial name"
    }

    project = ProsperWorks::Project.new(initial_attributes)
    assert_equal initial_attributes[:name], project.name

    response = ProsperWorks::Project.update(project, project_details)
    verify_response(project_details, project)
  end

  def test_project_delete
    delete_payload = JSON.generate({
      id: @id,
      is_deleted: true
    })
    stub_request(:delete, @single_resource_url).with(headers: headers).to_return(status: 200, body: delete_payload)

    project = ProsperWorks::Project.new(project_details)
    response = ProsperWorks::Project.delete(project.id)

    expected_result = {
      "id" => project.id,
      "is_deleted" => true
    }
    assert_equal expected_result, response
  end

end
