module ProsperWorks
  module ApiOperations
    module Search

      include ApiOperations::Connect

      def search(params={})
        uri = get_uri(api_name, 'search')

        response = send_request("post", uri, params)
        handle_multiple_response(response)
      end

    end
  end
end
