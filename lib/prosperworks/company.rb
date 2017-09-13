module ProsperWorks
  class Company < BaseEntity

    attr_accessor :address,
                  :contact_type_id,
                  :date_last_contacted,
                  :email_domain,
                  :interaction_count,
                  :title,

                  :phone_numbers,
                  :socials,
                  :websites,

    def self.api_name
      "companies"
    end

  end
end
