require "httparty"
require 'base64'
require 'modul_bank/configuration'
require "modul_bank/version"
require "modul_bank/payment_gatewat/transaction"
require 'modul_bank/payment_gatewat/singnature'
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
  # Your code goes here...
end
