class CreateSendevents < ActiveRecord::Migration
  def change
    create_table :sendevents do |t|
      t.string :event_name
      t.string :event_start_month
      t.string :event_start_day
      t.string :event_end_month
      t.string :event_end_day
      t.string :event_end_year
      t.string :event_start_hour
      t.string :event_start_minute
      t.string :event_start_ampm
      t.string :event_end_hour
      t.string :event_end_minute
      t.string :event_end_ampm
      t.text :event_description
      t.string :event_location_name
      t.string :event_location_address
      t.string :event_location_city
      t.string :event_location_state
      t.string :event_location_zip
      t.string :event_website
      t.string :event_cost
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
