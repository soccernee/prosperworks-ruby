module ProsperWorks
  class Project < BaseEntity

    attr_accessor :related_resource,
                  :status

    def self.api_name
      "projects"
    end

  end
end
