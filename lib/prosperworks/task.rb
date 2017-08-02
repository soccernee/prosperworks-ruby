module ProsperWorks
  class Task < BaseEntity
    extend ApiOperations::Search

    attr_accessor :completed_date,
                  :due_date,
                  :reminder_date,
                  :related_resource,
                  :priority,
                  :status

    def self.api_name
      "tasks"
    end

  end
end
