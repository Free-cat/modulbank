require 'spec_helper'

describe ModulBank::Client do

  it "generate signature" do
    resource = ModulBank::Client.new("00112233445566778899aabbccddeeff")
    expect(resource.send(:signature, {:merchant => 42,
                               amount: 123.45,
                               order_id: 36924,
                               description: 'Электровеник Bosch XWG598373202, с доставкой',
                               success_url: 'https://example.com/cart/36924/complete',
                               fail_url: 'https://example.com/cart/36924/error',
                               cancel_url: '',
                               unix_timestamp: 1399461194,
                               salt: 'EF99C55BFD2F1D8166610EACCFB927D5'})).to eql("ec2bb12e1f26047e48ecf1e592d94a1cb602a262")

  end

end

