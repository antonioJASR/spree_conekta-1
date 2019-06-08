module Spree
  class BillingIntegration::ConektaGateway::Cash < Gateway
    preference :auth_token, :string
    preference :source_method, :string, default: 'oxxo'

    def provider_class
      Spree::Conekta::Provider
    end

    def payment_source_class
      Spree::ConektaPayment
    end

    def method_type
      'conekta'
    end

    def card?
      false
    end

    def auto_capture?
      false
    end
  end
end
