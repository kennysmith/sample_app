class AddPlanIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :plan_id, :string
    add_column :users, :sends_remaining, :string
  end
end
