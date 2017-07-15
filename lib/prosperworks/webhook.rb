module ProsperWorks
  class Webhook < Base

    attr_accessor :event,
                  :secret,
                  :target,
                  :type

    extend ApiOperations::Create
    extend ApiOperations::Find
    extend ApiOperations::List
    extend ApiOperations::Delete

    def self.api_name
      "webhooks"
    end

  end
end