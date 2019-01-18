module ModulBank
  module PaymentGateway
    module Transaction

      def transaction(transaction_id: '', testing: 0)
        get("/api/v1/transaction", {:transaction_id => transaction_id, testing: testing.to_i, :unix_timestamp => Time.now.to_i})
      end

    end
  end
end
