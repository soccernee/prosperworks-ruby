module ProsperWorks
  module Errors
    class Unprocessable < Base

      def self.status_code
        422
      end

      def self.msg
        "The request is allowed and the resource exists, but is semantically invalid"
      end

    end
  end
end