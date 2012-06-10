# == Schema Information
#
# Table name: plans
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  price      :decimal(, )
#  kisses     :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Plan < ActiveRecord::Base
  attr_accessible :kisses, :name, :price

  has_many :users
  has_many :subscriptions
end
