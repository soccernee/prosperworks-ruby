module ProsperWorks
  module Errors
    class RateLimit < Base

      def self.status_code
        429
      end

      def self.msg
        "Rate Limit Reached"
      end
    end
  end
end