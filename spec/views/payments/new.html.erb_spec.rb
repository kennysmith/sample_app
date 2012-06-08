require 'spec_helper'

describe "payments/new" do
  before(:each) do
    assign(:payment, stub_model(Payment,
      :user_id => 1,
      :stripe_id => "MyString",
      :last_4_digits => "MyString",
      :card_type => "MyString"
    ).as_new_record)
  end

  it "renders new payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payments_path, :method => "post" do
      assert_select "input#payment_user_id", :name => "payment[user_id]"
      assert_select "input#payment_stripe_id", :name => "payment[stripe_id]"
      assert_select "input#payment_last_4_digits", :name => "payment[last_4_digits]"
      assert_select "input#payment_card_type", :name => "payment[card_type]"
    end
  end
end
