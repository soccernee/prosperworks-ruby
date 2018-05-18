require 'net/http'

module ProsperWorks
  module ApiOperations
    module Update

      include ApiOperations::Connect

        entity.set_attributes(attributes)
        id = entity.id
      def update(entity, attributes = {})

        uri = get_uri(api_name, id)

        response = send_request("put", uri, entity)
        handle_response(self.new, response)
      end

    end
  end
end