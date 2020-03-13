module ProsperWorks
  class CustomFieldDefinition < Base
    extend ApiOperations::List

    attr_accessor :name,
                  :data_type,
                  :currency,
                  :options

    def self.api_name
      "custom_field_definitions"
    end
  end
end
