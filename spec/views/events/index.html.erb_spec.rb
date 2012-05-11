require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
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
      ),
      stub_model(Event,
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
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Start Date".to_s, :count => 2
    assert_select "tr>td", :text => "End Date".to_s, :count => 2
    assert_select "tr>td", :text => "Start Time".to_s, :count => 2
    assert_select "tr>td", :text => "End Time".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Location Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location Address".to_s, :count => 2
    assert_select "tr>td", :text => "Location City".to_s, :count => 2
    assert_select "tr>td", :text => "Location State".to_s, :count => 2
    assert_select "tr>td", :text => "Location Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Cost".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
