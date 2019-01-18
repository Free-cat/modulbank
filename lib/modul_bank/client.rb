module ModulBank
  class Client
    include ModulBank::PaymentGateway::Singnature

    def initialize
      @secret_key = ModulBank.configuration.secret_key
    end

    def get(path, params = {})
      url = "https://pay.modulbank.ru/#{path}"
      response = HTTParty.get(url, options(params))
      JSON.parse(response.body)
    end

    def post(path, params = {})
      url = "https://pay.modulbank.ru/#{path}"
      response = HTTParty.post(url, options(params))
      JSON.parse(response.body)
    end

    def options(params)
      params.merge(signature: sign(params, @secret_key))
    end
  end
end