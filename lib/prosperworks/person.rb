module ProsperWorks
  class Person < BaseEntity

    attr_accessor :address,
                  :company_id,
                  :company_name,
                  :contact_type_id,
                  :date_last_contacted,
                  :interaction_count,
                  :title,

                  :emails,
                  :phone_numbers,
                  :socials,
                  :websites,

                  :prefix,
                  :first_name,
                  :middle_name,
                  :last_name,
                  :suffix

    def self.api_name
      "people"
    end

  end
end
