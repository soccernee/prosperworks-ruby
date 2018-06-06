require 'net/http'

module ProsperWorks
  module ApiOperations
    module Update

      include ApiOperations::Connect

      def update(entity, attributes = {})
        uri = get_uri(api_name, entity.id)

        response = send_request("put", uri, attributes)
        handle_response(self.new, response)
      end

    end
  end
end