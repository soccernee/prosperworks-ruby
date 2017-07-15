module ProsperWorks
  module Errors
    class Forbidden < Base

      def self.status_code
        403
      end

      def self.msg
        "The request is not allowed"
      end

    end
  end
end