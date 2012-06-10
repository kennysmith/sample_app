class Payment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :card_expiry_date, :card_type, :last_4_digits, :stripe_id, :user_id,
    :stripe_token, :last_4_digits, :subscription_type,
    :card_exp_month, :card_exp_year
  
  attr_accessor :stripe_token, :card_exp_month, :card_exp_year,
    :subscription_type

  before_save :set_card_expiry_date
  before_save :update_stripe

  validates :last_4_digits, :presence => true
  validates :stripe_token, :presence => true
  
  def set_card_expiry_date
    if self.card_exp_month.present? && self.card_exp_year.present?
      exp_date = "#{self.card_exp_year}-#{self.card_exp_month}-01"
      self.card_expiry_date = Date.parse(exp_date).end_of_month
    end
  end

  SINGLE_PLAN = 'single'
  UNLIMITED_PLAN = 'unlimited'

  def update_stripe
    if stripe_token.present?
      self.subscription_type = SINGLE_PLAN if self.user.plan_id == "1"
      self.subscription_type = UNLIMITED_PLAN if self.user.plan_id == "2"
      if stripe_id.nil?
        customer = Stripe::Customer.create(
          :description => self.user.name,
          :email => self.user.email,
          :card => stripe_token
        )
        self.last_4_digits = customer.active_card.last4
        self.stripe_id = customer.id

        if self.subscription_type == UNLIMITED_PLAN
          customer.update_subscription({:plan => UNLIMITED_PLAN})
        elsif self.subscription_type == SINGLE_PLAN
          charge = Stripe::Charge.create( :amount => 1000,
            :currency => "usd",
            :customer => customer.id,
            :description => "Single Use - One Time Charge" )
          self.charge_id = charge.id
        end

      else
        customer = Stripe::Customer.retrieve(stripe_id)
        customer.card = stripe_token
        customer.save
        self.last_4_digits = customer.active_card.last4
      end
      
      self.stripe_token = nil
    end
  end

  def upgrade
    if customer.present?
      customer.update_subscription({:plan => UNLIMITED_PLAN})
    end
  end

  def downgrade
    if customer.present?
      if customer.subscription.present?
        customer.cancel_subscription
      else
        return true
      end
    end
  end

  def customer
    @customer ||= Stripe::Customer.retrieve(self.stripe_id) rescue nil
  end
end
