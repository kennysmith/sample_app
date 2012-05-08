require 'spec_helper'

describe "sendevents/new" do
  before(:each) do
    assign(:sendevent, stub_model(Sendevent,
      :event_name => "MyString",
      :event_start_month => "MyString",
      :event_start_day => "MyString",
      :event_end_month => "MyString",
      :event_end_day => "MyString",
      :event_end_year => "MyString",
      :event_start_hour => "MyString",
      :event_start_minute => "MyString",
      :event_start_ampm => "MyString",
      :event_end_hour => "MyString",
      :event_end_minute => "MyString",
      :event_end_ampm => "MyString",
      :event_description => "MyText",
      :event_location_name => "MyString",
      :event_location_address => "MyString",
      :event_location_city => "MyString",
      :event_location_state => "MyString",
      :event_location_zip => "MyString",
      :event_website => "MyString",
      :event_cost => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new sendevent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sendevents_path, :method => "post" do
      assert_select "input#sendevent_event_name", :name => "sendevent[event_name]"
      assert_select "input#sendevent_event_start_month", :name => "sendevent[event_start_month]"
      assert_select "input#sendevent_event_start_day", :name => "sendevent[event_start_day]"
      assert_select "input#sendevent_event_end_month", :name => "sendevent[event_end_month]"
      assert_select "input#sendevent_event_end_day", :name => "sendevent[event_end_day]"
      assert_select "input#sendevent_event_end_year", :name => "sendevent[event_end_year]"
      assert_select "input#sendevent_event_start_hour", :name => "sendevent[event_start_hour]"
      assert_select "input#sendevent_event_start_minute", :name => "sendevent[event_start_minute]"
      assert_select "input#sendevent_event_start_ampm", :name => "sendevent[event_start_ampm]"
      assert_select "input#sendevent_event_end_hour", :name => "sendevent[event_end_hour]"
      assert_select "input#sendevent_event_end_minute", :name => "sendevent[event_end_minute]"
      assert_select "input#sendevent_event_end_ampm", :name => "sendevent[event_end_ampm]"
      assert_select "textarea#sendevent_event_description", :name => "sendevent[event_description]"
      assert_select "input#sendevent_event_location_name", :name => "sendevent[event_location_name]"
      assert_select "input#sendevent_event_location_address", :name => "sendevent[event_location_address]"
      assert_select "input#sendevent_event_location_city", :name => "sendevent[event_location_city]"
      assert_select "input#sendevent_event_location_state", :name => "sendevent[event_location_state]"
      assert_select "input#sendevent_event_location_zip", :name => "sendevent[event_location_zip]"
      assert_select "input#sendevent_event_website", :name => "sendevent[event_website]"
      assert_select "input#sendevent_event_cost", :name => "sendevent[event_cost]"
      assert_select "input#sendevent_first_name", :name => "sendevent[first_name]"
      assert_select "input#sendevent_last_name", :name => "sendevent[last_name]"
      assert_select "input#sendevent_email", :name => "sendevent[email]"
      assert_select "input#sendevent_phone", :name => "sendevent[phone]"
    end
  end
end
