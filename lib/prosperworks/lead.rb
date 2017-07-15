module ProsperWorks
  class Lead < BaseEntity

    attr_accessor :address,
                  :company_name,
                  :customer_source_id,
                  :date_last_contacted,
                  :interaction_count,
                  :monetary_value,
                  :status,
                  :status_id,
                  :title,

                  :email,
                  :phone_numbers,
                  :socials,
                  :websites,

                  :prefix,
                  :first_name,
                  :middle_name,
                  :last_name,
                  :suffix

    def self.api_name
      "leads"
    end

  end
end