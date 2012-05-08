# == Schema Information
#
# Table name: subscriptions
#
#  id                    :integer         not null, primary key
#  card                  :string(255)
#  description           :string(255)
#  plan                  :string(255)
#  plan_id               :string(255)
#  email                 :string(255)
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  stripe_customer_token :string(255)
#

class Subscription < ActiveRecord::Base
  	belongs_to :plan
  	validates_presence_of :plan_id
  	validates_presence_of :email
   	attr_accessible :stripe_card_token, :plan_id, :email
    attr_accessor :stripe_card_token

  def save_with_payment
    if valid?

      customer = Stripe::Customer.create(
        description:email, 
        plan: "singleevent",
        card: stripe_card_token )
      self.stripe_customer_token = customer.id
      save!
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end
end
