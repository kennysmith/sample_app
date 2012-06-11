class Event < ActiveRecord::Base
  attr_accessible :enddate, :endtime, :name, :startdate, :starttime

  belongs_to :user
  validates :user_id, :presence => true


  validates(:name, :presence => true)
  validates(:enddate, :presence => true)
  validates(:endtime, :presence => true)
  validates(:startdate, :presence => true)
  validates(:starttime, :presence => true)


  default_scope :order => 'events.created_at DESC'
end
