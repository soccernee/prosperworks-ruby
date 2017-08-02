module ProsperWorks
  class Project < BaseEntity
    extend ApiOperations::Search

    attr_accessor :related_resource,
                  :status

    def self.api_name
      "projects"
    end

  end
end
