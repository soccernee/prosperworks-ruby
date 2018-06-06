module ProsperWorks
  class User < Base
    extend ApiOperations::Create
    extend ApiOperations::Delete
    extend ApiOperations::Find
    extend ApiOperations::Update

    attr_accessor :username,
                  :email

    def self.api_name
      "user"
    end

  end
end
