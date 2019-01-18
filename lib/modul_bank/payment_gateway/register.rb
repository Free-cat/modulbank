module ModulBank
  module PaymentGateway
    module Register
      def register(client_id: nil, client_name: nil, client_email: nil, receipt_contact: nil, receipt_items: {}, cancel_url: nil)
        create_url('/pay', options({client_id: client_id,
                            client_name: client_name,
                            client_email: client_email,
                            receipt_contact: receipt_contact,
                            receipt_items: receipt_items,
                            unix_timestamp: Time.now.to_i,
                            cancel_url: cancel_url}.merge(@url_options)))
      end

      def create_url(path, params)
        Addressable::Template.new("https://pay.modulbank.ru{path*}{?q*}").expand( q: params, path: path).to_s
      end
    end
  end
end


