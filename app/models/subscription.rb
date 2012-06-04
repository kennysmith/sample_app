class Subscription < ActiveRecord::Base
  attr_accessible :plan_id, :status, :user_id, :eventsremaining
  belongs_to :user


 def upgrade_with_payment
    if valid?
    customer_token = @current_user.stripe_customer_token
      customer = Stripe::Customer.retrieve(customer_token)
      customer.update_subscription(:prorate => true, :plan => "2")
      @current_user 
      self.stripe_customer_token = customer.id
      save!
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end



end
