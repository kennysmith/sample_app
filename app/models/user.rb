# == Schema Information
#
# Table name: users
#
#  id                    :integer         not null, primary key
#  name                  :string(255)
#  email                 :string(255)
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  password_digest       :string(255)
#  remember_token        :string(255)
#  admin                 :boolean         default(FALSE)
#  stripe_customer_token :string(255)
#

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
class User < ActiveRecord::Base
    

  attr_accessible :subscriptions_attributes, :plan
  attr_accessible :stripe_card_token, :plan_id, :email, :postsremaining
  attr_accessible :email, :name, :password, :password_confirmation

  belongs_to :plan
  has_many :events
  has_many :payments
  has_many :subscriptions
  #has_many :subscriptions, :autosave => true
  
  #accepts_nested_attributes_for :subscriptions

  validates_presence_of :plan_id
  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password

  #attr_accessor :stripe_card_token, :subscription_attributes

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

#  def save_with_payment
#    if valid?
#      customer = Stripe::Customer.create(
#        email:email,
#        plan: plan_id,
#        card: stripe_card_token )
#      self.stripe_customer_token = customer.id
#      save!
#    end
#    rescue Stripe::InvalidRequestError => e
#      logger.error "Stripe error while creating customer: #{e.message}"
#      errors.add :base, "There was a problem with your credit card."
#      false
#  end
#
#  def paid_upgrade
#    if valid?
#      upgrade = Stripe::Charge.create(
#        card: stripe_card_token,
#        customer: stripe_customer_token,
#        )
#    end
#  end


  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end


end
