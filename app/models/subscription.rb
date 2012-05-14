class Subscription < ActiveRecord::Base
  attr_accessible :plan_id, :status, :user_id
  belongs_to :user
  def new
  end

  def create 
  end

end
