module ProsperWorks
  class ActivityType < BaseEntity
    attr_accessor :id,
                  :name,
                  :category

    def self.api_name
      "activity_types"
    end

    # Note: We don't extend ApiOperations::List because the response body of this resource
    # is a hash where the keys are the categories and the values (arrays) are the activity types,
    # and we only want the activity types (the category is also and attr of the activity type).
    # So, we only grab the arrays and flatten them.
    def self.list
      uri = get_uri(api_name)
      response = send_request("get", uri)

      case response.code.to_i
      when 200
        json_object = JSON.parse(response.body)
        json_object.values.flatten.map do |res|
          self.new(res)
        end
      else
        return handle_response(nil, response)
      end
    end

  end
end
