require_relative '../lib/modul_bank'

RSpec.configure do |config|
  config.before(:all) do
    ModulBank.configure do |config|
      config.secret_key = '00112233445566778899aabbccddeeff'
      config.merchant = 42
      config.fail_url = 'https://example.com/cart/36924/error'
      config.success_url = 'https://example.com/cart/36924/complete'
    end
  end
end