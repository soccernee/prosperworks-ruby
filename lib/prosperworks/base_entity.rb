module ProsperWorks
  class BaseEntity < Base

    # used for the 6 main entity types

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
