class Event < ActiveRecord::Base
  attr_accessible :cost, :description, :email, :end_date, :end_time, :first_name, :last_name, :location_address, :location_city, :location_name, :location_state, :location_zip, :name, :phone, :start_date, :start_time, :website
end
