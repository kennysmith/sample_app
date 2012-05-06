class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :card
      t.string :description
      t.string :plan
      t.string :plan_id
      t.string :email

      t.timestamps
    end
  end
end
