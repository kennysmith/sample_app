require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :name => "MyString",
      :start_date => "MyString",
      :end_date => "MyString",
      :start_time => "MyString",
      :end_time => "MyString",
      :description => "MyText",
      :location_name => "MyString",
      :location_address => "MyString",
      :location_city => "MyString",
      :location_state => "MyString",
      :location_zip => "MyString",
      :website => "MyString",
      :cost => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "input#event_start_date", :name => "event[start_date]"
      assert_select "input#event_end_date", :name => "event[end_date]"
      assert_select "input#event_start_time", :name => "event[start_time]"
      assert_select "input#event_end_time", :name => "event[end_time]"
      assert_select "textarea#event_description", :name => "event[description]"
      assert_select "input#event_location_name", :name => "event[location_name]"
      assert_select "input#event_location_address", :name => "event[location_address]"
      assert_select "input#event_location_city", :name => "event[location_city]"
      assert_select "input#event_location_state", :name => "event[location_state]"
      assert_select "input#event_location_zip", :name => "event[location_zip]"
      assert_select "input#event_website", :name => "event[website]"
      assert_select "input#event_cost", :name => "event[cost]"
      assert_select "input#event_first_name", :name => "event[first_name]"
      assert_select "input#event_last_name", :name => "event[last_name]"
      assert_select "input#event_email", :name => "event[email]"
      assert_select "input#event_phone", :name => "event[phone]"
    end
  end
end
