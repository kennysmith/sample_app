class AddEventsRemainingToSubscriptions < ActiveRecord::Migration
  def change
  	add_column :subscriptions, :eventsremaining, :integer
  	remove_column :users, :sends_remaining
  	remove_column :users, :admin
  	remove_column :users, :plan
  	remove_column :users, :postsremaining
  end
end
