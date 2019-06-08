module Spree
  class BillingIntegration::ConektaGateway::MonthlyPayment < Gateway
    preference :auth_token, :string
    preference :public_auth_token, :string
    preference :source_method, :string, default: 'card'

    def provider_class
      Spree::Conekta::Provider
    end

    def payment_source_class
      CreditCard
    end

    def card?
      true
    end

    def auto_capture?
      true
    end

    def with_installments?
      true
    end

    def method_type
      'conekta_card'
    end
  end
end
