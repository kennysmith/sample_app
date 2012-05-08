class Sendevent < ActiveRecord::Base
  attr_accessible :email, :event_cost, :event_description, :event_end_ampm, :event_end_day, :event_end_hour, :event_end_minute, :event_end_month, :event_end_year, :event_location_address, :event_location_city, :event_location_name, :event_location_state, :event_location_zip, :event_name, :event_start_ampm, :event_start_day, :event_start_hour, :event_start_minute, :event_start_month, :event_website, :first_name, :last_name, :phone
end
