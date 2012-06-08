require 'spec_helper'

describe "plans/show" do
  before(:each) do
    @plan = assign(:plan, stub_model(Plan,
      :name => "Name",
      :price => "9.99",
      :kisses => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
  end
end
