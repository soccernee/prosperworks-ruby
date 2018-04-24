module ProsperWorks
  class Activity < BaseEntity
    attr_accessor :id,
                  :name,
                  :type

    def self.api_name
      "activities"
    end
  end
end
