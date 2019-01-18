module ModulBank
  class Client
    include ModulBank::PaymentGateway::Singnature
    include ModulBank::PaymentGateway::Register
    include ModulBank::PaymentGateway::Transaction
    include ModulBank::PaymentGateway::Bill
    include ModulBank::PaymentGateway::Refund

    def initialize
      @options = {
          secret_key: ModulBank.configuration.secret_key,
          merchant: ModulBank.configuration.merchant
      }
      @url_options = {
          fail_url: ModulBank.configuration.fail_url,
          success_url: ModulBank.configuration.success_url
      }
    end

    def get(path, params = {})
      url = "https://pay.modulbank.ru/#{path}"
      JSON.parse(HTTParty.get(url, options(params).body))
    end

    def post(path, params = {})
      url = "https://pay.modulbank.ru/#{path}"
      response = HTTParty.post(url, options(params))
      JSON.parse(response.body)
    end

    def options(params)
      params.merge(signature: sign(args: params, secret_key: @options[:secret_key])).merge(@options).to_h
    end
  end
end