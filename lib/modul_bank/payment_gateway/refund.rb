module ModulBank
  module PaymentGateway
    module Refund

      def refund(transaction_id: '', amount: '')
        post("/api/v1/refund", {:transaction => transaction_id, amount: amount, :unix_timestamp => Time.now.to_i})
      end

    end
  end
end
