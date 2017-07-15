require 'net/http'

module ProsperWorks
  module ApiOperations
    module Delete

      include ApiOperations::Connect

      def delete(id) 
        uri = get_uri(api_name, id)

        response = send_request("delete", uri)
        handle_delete_response(response)
      end

      def handle_delete_response(response)
        result = handle_response(nil, response)
        if result.is_a?(ProsperWorks::Errors)
          # pass the error along
          result
        else
          JSON.parse(response.body)
        end
      end

    end
  end
end