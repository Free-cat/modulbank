module ModulBank
  module PaymentGateway
    module Transactions

      def transactions(state: '', timestamp_from: '', timestamp_to: '')
        get("/api/v1/transactions", {:state => state, timestamp_from: timestamp_from, timestamp_to: timestamp_to, :unix_timestamp => Time.now.to_i})
      end

    end
  end
end
