module ProsperWorks
  class PipelineStage < Base
    extend ApiOperations::List

    attr_accessor :name,
                  :pipeline_id,
                  :win_probability

    def self.api_name
      "pipeline_stages"
    end

  end
end
