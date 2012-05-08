require 'spec_helper'

describe "sendevents/show" do
  before(:each) do
    @sendevent = assign(:sendevent, stub_model(Sendevent,
      :event_name => "Event Name",
      :event_start_month => "Event Start Month",
      :event_start_day => "Event Start Day",
      :event_end_month => "Event End Month",
      :event_end_day => "Event End Day",
      :event_end_year => "Event End Year",
      :event_start_hour => "Event Start Hour",
      :event_start_minute => "Event Start Minute",
      :event_start_ampm => "Event Start Ampm",
      :event_end_hour => "Event End Hour",
      :event_end_minute => "Event End Minute",
      :event_end_ampm => "Event End Ampm",
      :event_description => "MyText",
      :event_location_name => "Event Location Name",
      :event_location_address => "Event Location Address",
      :event_location_city => "Event Location City",
      :event_location_state => "Event Location State",
      :event_location_zip => "Event Location Zip",
      :event_website => "Event Website",
      :event_cost => "Event Cost",
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Event Name/)
    rendered.should match(/Event Start Month/)
    rendered.should match(/Event Start Day/)
    rendered.should match(/Event End Month/)
    rendered.should match(/Event End Day/)
    rendered.should match(/Event End Year/)
    rendered.should match(/Event Start Hour/)
    rendered.should match(/Event Start Minute/)
    rendered.should match(/Event Start Ampm/)
    rendered.should match(/Event End Hour/)
    rendered.should match(/Event End Minute/)
    rendered.should match(/Event End Ampm/)
    rendered.should match(/MyText/)
    rendered.should match(/Event Location Name/)
    rendered.should match(/Event Location Address/)
    rendered.should match(/Event Location City/)
    rendered.should match(/Event Location State/)
    rendered.should match(/Event Location Zip/)
    rendered.should match(/Event Website/)
    rendered.should match(/Event Cost/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
  end
end
