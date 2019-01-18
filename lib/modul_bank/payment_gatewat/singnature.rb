module ModulBank
  module PaymentGateway
    module Singnature
      def sign(args = {}, secret_key = '')
        line = args.compact
                   .transform_values! { |value| Base64.encode64(value.to_s).gsub(/\s/, '') }
                   .sort
                   .map { |pair| pair.join('=') }.join('&')

        calculate_digest(line, secret_key)
      end

      private def calculate_digest(line, secret_key)
        Digest::SHA1.hexdigest(
            secret_key + Digest::SHA1.hexdigest(secret_key + line).downcase
        )
      end
    end
  end
end


