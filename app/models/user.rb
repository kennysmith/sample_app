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
  attr_accessible :stripe_card_token, :plan_id, :postsremaining
  attr_accessible :email, :name, :password, :password_confirmation

  belongs_to :plan
  has_many :events
  has_many :payments
  has_many :subscriptions
  #has_many :subscriptions, :autosave => true
  
  #accepts_nested_attributes_for :subscriptions

  validates :plan_id, :presence => true
  validates :email, :presence => true

  has_secure_password

  #attr_accessor :stripe_card_token, :subscription_attributes

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  before_save :validate_email_uniqueness

  def validate_email_uniqueness
    user = User.find_by_email(self.email)
    if user.present?
      self.errors.add :email, "has already been taken"
      return false
    else
      return true
    end
  end

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
