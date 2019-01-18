module ModulBank
  class Client
    module Transaction

      def transaction(transaction_id, merchant)
        response = get("/api/v1/transaction", {:transaction_id => transaction_id, :merchant => merchant, :unix_timestamp => Time.now.to_i})
        response
      end

    end
  end
end
