require 'spec_helper'

describe "payments/index" do
  before(:each) do
    assign(:payments, [
      stub_model(Payment,
        :user_id => 1,
        :stripe_id => "Stripe",
        :last_4_digits => "Last 4 Digits",
        :card_type => "Card Type"
      ),
      stub_model(Payment,
        :user_id => 1,
        :stripe_id => "Stripe",
        :last_4_digits => "Last 4 Digits",
        :card_type => "Card Type"
      )
    ])
  end

  it "renders a list of payments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Stripe".to_s, :count => 2
    assert_select "tr>td", :text => "Last 4 Digits".to_s, :count => 2
    assert_select "tr>td", :text => "Card Type".to_s, :count => 2
  end
end
