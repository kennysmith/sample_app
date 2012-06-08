class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.string :stripe_id
      t.string :last_4_digits
      t.date :card_expiry_date
      t.string :card_type

      t.timestamps
    end
  end
end
