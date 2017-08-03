module ProsperWorks
  class Pipeline < Base
    extend ApiOperations::List

    attr_accessor :name,
                  :stages

    def self.api_name
      "pipelines"
    end

  end
end
