require 'base64'
require 'digest/sha1'


module ModulBank
  class Client
    include HTTParty
    include ModulBank::Client::Transaction
    base_uri "https://api.groovehq.com/v1"
    format :json

    def initialize(secret_key)
      @secret_key = secret_key
      @secret_key = '00112233445566778899aabbccddeeff'
      puts signature({:merchant => 42,
                      amount: 123.45,
                      order_id: 36924,
                      description: 'Электровеник Bosch XWG598373202, с доставкой',
                      success_url: 'https://example.com/cart/36924/complete',
                      fail_url: 'https://example.com/cart/36924/error',
                      cancel_url: '',
                      unix_timestamp: 1399461194,
                      salt: 'EF99C55BFD2F1D8166610EACCFB927D5'})
    end

    def get(path, params = {})
      url = "https://pay.modulbank.ru/#{path}"
      response = HTTParty.get(url, options(params))
      JSON.parse(response.body)
    end

    def post(path, params)
      url = "https://pay.modulbank.ru/#{path}"
      response = HTTParty.post(url, options(params))
      JSON.parse(response.body)
    end

    private

    attr_reader :secret_key

    def signature(params)
      calculate(delete_blank_and_sort(params))
    end

    def calculate(values)
      sha1(@secret_key.to_s + (sha1(@secret_key.to_s + values.to_s).to_s.downcase)).to_s
    end

    def options(params)
      params.merge(signature: signature(params))
    end

    def base64(str)
      Base64.encode64(str.to_s).strip.gsub("\n", "")
    end

    def sha1(str)
      Digest::SHA1.hexdigest str
    end

    def delete_blank_and_sort(params)
      flatten(params.delete_if {|_, v| v.nil? || v == ''}.sort.to_h.transform_values!(&method(:base64)).to_h)
    end

    def flatten(hash)
      string = ""
      hash.each do
      |key, value|
        key = "&#{key}" if string != "" #nasty hack
        string += "#{key}=#{value}"
      end

      string
    end
  end
end