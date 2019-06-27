class Spree::ConektaPayment < ActiveRecord::Base
  belongs_to :payment_method
  has_many :payments, as: :source

  attr_accessor :payment_type, :first_name, :last_name

  def actions
    %w{capture}
  end

  def can_capture?(payment)
    ['checkout', 'pending'].include?(payment.state)
  end
end
