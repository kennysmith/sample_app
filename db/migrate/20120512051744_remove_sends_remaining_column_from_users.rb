class RemoveSendsRemainingColumnFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :sends_remaining
  end

  def down
  end
end
