class AddStatusColFromSubscription < ActiveRecord::Migration
  def change
  	add_column :subscriptions, :status, :string
  end
end
