module ProsperWorks
  class BaseEntity < Base
    #
    # Specialized base class, only to be used for the 6 main entity types:
    #   company
    #   lead
    #   opportunity
    #   person
    #   project
    #   task

    attr_accessor :assignee_id,
                  :custom_fields,
                  :date_modified,
                  :details,
                  :name,
                  :tags


    extend ApiOperations::Create
    extend ApiOperations::Delete
    extend ApiOperations::Find
    extend ApiOperations::Update
    extend ApiOperations::Search

  end
end
