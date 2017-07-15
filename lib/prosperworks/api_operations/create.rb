require 'net/http'
require 'json'

module ProsperWorks
  module ApiOperations
    module Create

      include ApiOperations::Connect

      def create(attributes)
        entity = self.new(attributes)
        uri = get_uri(api_name)

        response = send_request("post", uri, entity)
        handle_response(self.new, response)
      end

    end
  end
end