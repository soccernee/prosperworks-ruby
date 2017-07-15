module ProsperWorks
  module Errors
    class Unauthorized < Base

      def self.status_code
        401
      end

      def self.msg
        "The API Key was not found"
      end

    end
  end
end