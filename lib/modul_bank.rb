require "httparty"
require 'base64'
require "addressable/template"
require 'modul_bank/errors/configuration'
require 'modul_bank/configuration'
require "modul_bank/version"
require 'modul_bank/payment_gateway/singnature'
require "modul_bank/payment_gateway/transaction"
require "modul_bank/payment_gateway/transactions"
require 'modul_bank/payment_gateway/register'
require 'modul_bank/payment_gateway/bill'
require 'modul_bank/payment_gateway/refund'
require "modul_bank/client"


module ModulBank
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Error < StandardError; end
end
