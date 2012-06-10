class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :plan_id
      t.string :status
      t.integer :eventsremaining

      t.timestamps
    end
  end
end
