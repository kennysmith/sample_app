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
  belongs_to :plan
  has_many :sendevents

  validates_presence_of :plan_id
  validates_presence_of :email

  attr_accessible :stripe_card_token, :plan_id, :email
  attr_accessible :email, :name, :password, :password_confirmation, :sends_remaining
  has_secure_password

  attr_accessor :stripe_card_token

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(
        email:email, 
        plan: plan_id,
        card: stripe_card_token )
      self.stripe_customer_token = customer.id
      save!
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end

  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
