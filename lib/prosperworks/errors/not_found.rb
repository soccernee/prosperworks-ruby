module ProsperWorks
  module Errors
    class NotFound < Base

      def self.status_code
        404
      end

      def self.msg
        "Resource Not Found"
      end

    end
  end
end