require 'prosperworks/api_operations/connect'
require 'prosperworks/utils'

require 'prosperworks/api_operations/create'
require 'prosperworks/api_operations/delete'
require 'prosperworks/api_operations/find'
require 'prosperworks/api_operations/list'
require 'prosperworks/api_operations/search'
require 'prosperworks/api_operations/update'

require 'prosperworks/errors/base'
require 'prosperworks/errors/bad_request'
require 'prosperworks/errors/forbidden'
require 'prosperworks/errors/not_found'
require 'prosperworks/errors/rate_limit'
require 'prosperworks/errors/server_error'
require 'prosperworks/errors/unauthorized'
require 'prosperworks/errors/unprocessable'


require 'prosperworks/base'
require 'prosperworks/base_entity'
require 'prosperworks/client'
require 'prosperworks/company'
require 'prosperworks/configuration'
require 'prosperworks/lead'
require 'prosperworks/opportunity'
require 'prosperworks/pipeline'
require 'prosperworks/pipeline_stage'
require 'prosperworks/customer_source'
require 'prosperworks/person'
require 'prosperworks/project'
require 'prosperworks/task'
require 'prosperworks/version'
require 'prosperworks/webhook'
require 'prosperworks/user'

module ProsperWorks

    def self.reset!
      @client = nil
    end

    def self.client
      @client ||= Client.new
    end

    def self.configure(&block)
      reset!
      client.configure(&block)
    end
end
