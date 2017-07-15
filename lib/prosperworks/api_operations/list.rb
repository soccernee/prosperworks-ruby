require 'net/http'

module ProsperWorks
  module ApiOperations
    module List

      include ApiOperations::Connect

      def list
        uri = get_uri(api_name)

        response = send_request("get", uri)
        handle_multiple_response(response)
      end

      def handle_multiple_response(response)
        result = handle_response(nil, response)
        if result.is_a?(ProsperWorks::Errors)
          # pass the error along
          result
        else
          result.map do |webhook|
            self.new(webhook)
          end
        end
      end

    end
  end
end