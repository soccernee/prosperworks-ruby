module ProsperWorks
  module Errors
    class BadRequest < Base

      def self.status_code
        400
      end

      def self.msg
        "Bad Request"
      end

    end
  end
end