require 'net/http'

module ProsperWorks
  module ApiOperations
    module List

      include ApiOperations::Connect

      def list(query_params = {})
        uri = get_uri(api_name)
        uri.query = URI.encode_www_form(query_params)

        response = send_request("get", uri)
        handle_multiple_response(response)
      end

    end
  end
end
