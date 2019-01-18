module ModulBank
  class Configuration
    attr_accessor :secret_key, :merchant, :success_url, :fail_url, :testing

    def initialize
      @secret_key = nil
      @merchant = nil
      @success_url = nil
      @fail_url = nil
      @testing = nil
    end
  end
end
