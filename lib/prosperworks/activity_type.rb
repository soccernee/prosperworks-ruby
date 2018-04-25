module ProsperWorks
  class ActivityType < BaseEntity
    attr_accessor :id,
                  :name,
                  :category

    def self.api_name
      "activity_types"
    end

    # Note: We override the list method because the response is a hash where
    # the values are arrays. And we want only the elements of the arrays
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
