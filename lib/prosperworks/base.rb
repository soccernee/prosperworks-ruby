module ProsperWorks
  class Base
    include ProsperWorks::JSONable

    attr_accessor :id,
                  :date_created

    def self.client
      ProsperWorks.client
    end

    def initialize(attributes = {})
      set_attributes(attributes)
    end

    def set_attributes(attributes)
      attributes.each do |key, value|
        if self.respond_to?(key.to_sym)
          self.send("#{key}=", value)
        end
      end
    end

  end
end