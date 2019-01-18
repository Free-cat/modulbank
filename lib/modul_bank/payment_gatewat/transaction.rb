module ModulBank
  module PaymentGateway
    module Transaction

      def transaction(transaction_id, merchant)
        get("/api/v1/transaction", {:transaction_id => transaction_id, :merchant => merchant, :unix_timestamp => Time.now.to_i})
      end

    end
  end
end
