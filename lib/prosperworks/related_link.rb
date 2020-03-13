module ProsperWorks
  class RelatedLink < Base
    extend ApiOperations::List

    attr_accessor :source,
                  :target,
                  :custom_field_definition_id

    def self.api_name
      "related_links"
    end
  end
end
