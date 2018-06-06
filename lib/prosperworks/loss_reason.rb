module ProsperWorks
  class LossReason < Base
    extend ApiOperations::List

    attr_accessor :id,
                  :name

    def self.api_name
      "loss_reasons"
    end
  end
end
