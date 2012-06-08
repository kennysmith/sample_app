require 'spec_helper'

describe "payments/show" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :user_id => 1,
      :stripe_id => "Stripe",
      :last_4_digits => "Last 4 Digits",
      :card_type => "Card Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Stripe/)
    rendered.should match(/Last 4 Digits/)
    rendered.should match(/Card Type/)
  end
end
