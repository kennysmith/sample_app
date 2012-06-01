class RemoveStatusColFromSubscription < ActiveRecord::Migration
  def up
  	remove_column :subscriptions, :status
  end

  def down
  end
end
