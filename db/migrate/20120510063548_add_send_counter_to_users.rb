class AddSendCounterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sends_remaining, :string
  end
end
