require 'spec_helper'

describe "sendevents/index" do
  before(:each) do
    assign(:sendevents, [
      stub_model(Sendevent,
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
      ),
      stub_model(Sendevent,
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
      )
    ])
  end

  it "renders a list of sendevents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Event Name".to_s, :count => 2
    assert_select "tr>td", :text => "Event Start Month".to_s, :count => 2
    assert_select "tr>td", :text => "Event Start Day".to_s, :count => 2
    assert_select "tr>td", :text => "Event End Month".to_s, :count => 2
    assert_select "tr>td", :text => "Event End Day".to_s, :count => 2
    assert_select "tr>td", :text => "Event End Year".to_s, :count => 2
    assert_select "tr>td", :text => "Event Start Hour".to_s, :count => 2
    assert_select "tr>td", :text => "Event Start Minute".to_s, :count => 2
    assert_select "tr>td", :text => "Event Start Ampm".to_s, :count => 2
    assert_select "tr>td", :text => "Event End Hour".to_s, :count => 2
    assert_select "tr>td", :text => "Event End Minute".to_s, :count => 2
    assert_select "tr>td", :text => "Event End Ampm".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Event Location Name".to_s, :count => 2
    assert_select "tr>td", :text => "Event Location Address".to_s, :count => 2
    assert_select "tr>td", :text => "Event Location City".to_s, :count => 2
    assert_select "tr>td", :text => "Event Location State".to_s, :count => 2
    assert_select "tr>td", :text => "Event Location Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Event Website".to_s, :count => 2
    assert_select "tr>td", :text => "Event Cost".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
