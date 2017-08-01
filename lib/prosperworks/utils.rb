require 'json'

module ProsperWorks

  #
  # Modified version of the Jsonable gem, all credit goes to the
  # authors of that gem
  #
  module SerializeEntity

    def serialize_pw_entity(*a)
      result = {}
      self.instance_variables.each do |var|
        trimmed_var = var.to_s.gsub!("@", "")
        result[trimmed_var] = self.instance_variable_get var
      end
      result.to_json(*a)
    end

  end

end
