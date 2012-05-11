class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :start_date
      t.string :end_date
      t.string :start_time
      t.string :end_time
      t.text :description
      t.string :location_name
      t.string :location_address
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.string :website
      t.string :cost
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
