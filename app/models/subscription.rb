class Subscription < ActiveRecord::Base
  attr_accessible :eventsremaining, :plan_id, :status, :user_id

  belongs_to :plan
  belongs_to :user

  def active_subscription!
    self.status = "active"
    return self.save
  end

  def inactive_subscription!
    self.status = "inactive"
    return self.save
  end

  def decrease_event_count
    self.eventsremaining = self.eventsremaining - 1
    return self.save
  end

  def upgrade
    self.plan_id = "2"
    if(Rails.env == 'development' || Rails.env == 'test')
      self.status = "active"
    else
      self.status = "notverified"
    end
    self.eventsremaining = self.plan.kisses
    return self.save
  end

  def downgrade
    self.plan_id = "0"
    self.status = "none"
    self.eventsremaining = 0
    return self.save
  end
end
