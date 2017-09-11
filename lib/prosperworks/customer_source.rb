module ProsperWorks
  class CustomerSource < Base
    extend ApiOperations::List

    attr_accessor :name

    def self.api_name
      "customer_sources"
    end

  end
end
