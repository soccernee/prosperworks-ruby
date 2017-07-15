module ProsperWorks
  module Errors
    class ServerError < Base

      def self.status_code
        500
      end

      def self.msg
        "Server Error"
      end

    end
  end
end