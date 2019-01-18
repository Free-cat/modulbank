require 'spec_helper'

describe ModulBank::Client do

  it "generate signature" do
    resource = ModulBank::Client.new
    params = resource.options({amount: 123.45,
                               order_id: 36924,
                               description: 'Электровеник Bosch XWG598373202, с доставкой',
                               cancel_url: nil,
                               unix_timestamp: 1399461194,
                               salt: 'EF99C55BFD2F1D8166610EACCFB927D5'})

    [:secret_key, :signature].each { |k| params.delete(k) }

    expect(resource.send(:sign, args: params, secret_key: ModulBank.configuration.secret_key)).to eql("ec2bb12e1f26047e48ecf1e592d94a1cb602a262")
  end

end