require 'net/http'

module ProsperWorks
  module ApiOperations
    module Find

      include ApiOperations::Connect

      def find(id)
        uri = get_uri(api_name, id)

        response = send_request("get", uri)
        handle_response(self.new, response)
      end

    end
  end
end