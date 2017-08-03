module ProsperWorks
  class Client
    extend Forwardable

    API_VERSION_NUMBER = 1

    def headers
      {
        "Content-Type" => "application/json",
        "X-PW-Application" => "developer_api",
        "X-PW-UserEmail" => configuration.user_email,
        "X-PW-AccessToken" => configuration.access_token
      }
    end

    def base_url
      "https://api.prosperworks.com/developer_api/v#{API_VERSION_NUMBER}/"
    end

    def configure
      yield configuration if block_given?
    end

    def configuration
      @configuration ||= Configuration.new
    end

  end
end