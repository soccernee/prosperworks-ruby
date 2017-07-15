require "test_helper"

class PersonTest < Minitest::Test
  include Helpers

  def verify_response(expected, person)
    assert person.is_a?(ProsperWorks::Person)
    assert_equal @id, person.id
    assert_equal expected.keys.length, person.instance_variables.length

    expected.each do |key, value|
      next if value.is_a?(Enumerable)
      if value.nil?
        assert_nil person.send(key)
      else
        assert_equal value, person.send(key)
      end
    end
  end

  def setup
    @id = person_details[:id]
    @single_resource_url = get_uri(ProsperWorks::Person.api_name, @id)
    @create_url = get_uri(ProsperWorks::Person.api_name)
  end

  def test_person_get
    stub_request(:get, @single_resource_url).with(headers: headers).to_return(status: 200, body: person_payload)

    person = ProsperWorks::Person.find(@id)
    verify_response(person_details, person)
  end

  def test_person_create
    stub_request(:post, @create_url).with(headers: headers).to_return(status: 200, body: person_payload)

    person = ProsperWorks::Person.create(person_details)
    verify_response(person_details, person)
  end

  def test_person_update
    stub_request(:put, @single_resource_url).with(headers: headers).to_return(status: 200, body: person_payload)

    initial_attributes = {
      id: @id,
      name: "some initial name",
      title: "Thinker"
    }

    person = ProsperWorks::Person.new(initial_attributes)
    assert_equal initial_attributes[:name], person.name
    assert_equal initial_attributes[:title], person.title

    response = ProsperWorks::Person.update(person, person_details)
    verify_response(person_details, person)
  end

  def test_person_delete
    delete_payload = JSON.generate({
      id: @id,
      is_deleted: true
    })
    stub_request(:delete, @single_resource_url).with(headers: headers).to_return(status: 200, body: delete_payload)

    person = ProsperWorks::Person.new(person_details)
    response = ProsperWorks::Person.delete(person.id)

    expected_result = {
      "id" => person.id,
      "is_deleted" => true
    }
    assert_equal expected_result, response
  end

end
