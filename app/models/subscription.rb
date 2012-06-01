class Subscription < ActiveRecord::Base
  attr_accessible :plan_id, :status, :user_id, :eventsremaining
  belongs_to :user

end
