module ProsperWorks
  class Task < BaseEntity

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
