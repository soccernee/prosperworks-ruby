module ProsperWorks
  class Opportunity < BaseEntity
    extend ApiOperations::Search

    attr_accessor :close_date,
                  :company_id,
                  :company_name,
                  :customer_source_id,
                  :interaction_count,
                  :loss_reason_id,
                  :monetary_value,
                  :pipeline_id,
                  :primary_contact_id,
                  :priority,
                  :pipeline_stage_id,
                  :status,
                  :win_probability

    def self.api_name
      "opportunities"
    end

  end
end
