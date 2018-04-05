module ProsperWorks
  class User < Base
    extend ApiOperations::List

    attr_accessor :username,
                  :email

    def self.api_name
      "user"
    end

  end
end
