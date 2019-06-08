module Spree
   class BillingIntegration::ConektaGateway < Gateway
     preference :auth_token, :string
     preference :source_method, :string, default: ['card, cash, bank']

     def provider_class
       warn "DEPRECATION WARNING: Spree::BillingIntegration::Conekta will be deprecated, please use BillingIntegration::ConektaGateway::#{preferred_source_method.titleize} instead"
       Spree::Conekta::Provider
     end

     def payment_source_class
       card? ? CreditCard : Spree::ConektaPayment
     end

     def method_type
       card? ? 'gateway' : 'conekta'
     end

     def card?
       preferred_source_method.eql?('card')
     end

     def auto_capture?
       false
     end
   end
end
