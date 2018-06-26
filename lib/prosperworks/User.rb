module ProsperWorks
  class User < BaseEntity

    attr_accessor :id,
                  :name,
                  :email,
    def self.api_name
      "User"
    end

  end
end
