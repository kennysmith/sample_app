class AddPlanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :plan, :string
  end
end
