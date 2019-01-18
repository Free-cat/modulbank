module ModulBank
  module PaymentGateway
    module Bill

      def create_bill(amount: '', description: '', client_email: '', send_letter: 0, receipt_contact: '', receipt_items: {})
        post("/api/v1/bill", {amount: amount, description: description, client_email: client_email, send_letter: send_letter, receipt_contact: receipt_contact, receipt_items: receipt_items, :unix_timestamp => Time.now.to_i})
      end

      def get_bill(id: '')
        get("/api/v1/bill", {id: id, :unix_timestamp => Time.now.to_i})
      end

    end
  end
end
