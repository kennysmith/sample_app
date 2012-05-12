require 'spec_helper'

describe Event do
  
  before do
  	@event = Event.new(name: "Test Event", startdate: "02/21/2012", starttime: "05:30pm", enddate: "02/21/2012", endtime: "6:30pm")
  end

  subject { @event }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "when startdate is not present" do
  	before { @user.startdate = " " }
  	it { should_not be_valid }
  end

  describe "when starttime is not present" do
  	before { @user.starttime = " " }
  	it { should_not be_valid }
  end


end
