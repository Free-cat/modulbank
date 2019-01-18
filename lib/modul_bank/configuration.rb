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

    def secret_key
      raise Errors::Configuration, "ModulBank secret key missing!" unless @secret_key
      @secret_key
    end

    def merchant
      raise Errors::Configuration, "ModulBank merchant missing!" unless @merchant
      @merchant
    end
  end
end
