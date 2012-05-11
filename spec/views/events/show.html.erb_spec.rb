require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :start_date => "Start Date",
      :end_date => "End Date",
      :start_time => "Start Time",
      :end_time => "End Time",
      :description => "MyText",
      :location_name => "Location Name",
      :location_address => "Location Address",
      :location_city => "Location City",
      :location_state => "Location State",
      :location_zip => "Location Zip",
      :website => "Website",
      :cost => "Cost",
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Start Date/)
    rendered.should match(/End Date/)
    rendered.should match(/Start Time/)
    rendered.should match(/End Time/)
    rendered.should match(/MyText/)
    rendered.should match(/Location Name/)
    rendered.should match(/Location Address/)
    rendered.should match(/Location City/)
    rendered.should match(/Location State/)
    rendered.should match(/Location Zip/)
    rendered.should match(/Website/)
    rendered.should match(/Cost/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
  end
end
