class StripeController < ApplicationController
  def webhook
    data_json = JSON.parse request.body.read

    if data_json["type"] == "charge.succeeded"
      if (defined?(data_json["data"]["object"]["description"])).present? && data_json["data"]["object"]["description"] != nil
        if data_json["data"]["object"]["description"].include? "Single Use"
          @payment = Payment.find_by_stripe_id(data_json['data']['object']['customer'])
          @user = @payment.user if @payment.present?
          NotificationMailer.single_use_charge_succeeded(data_json["data"]["object"], @user).deliver if @user.present?
        end
      end
    end

    if data_json["type"] == "charge.failed"
      if (defined?(data_json["data"]["object"]["description"])).present? && data_json["data"]["object"]["description"] != nil
        if data_json["data"]["object"]["description"].include? "Single Use"
          @payment = Payment.find_by_stripe_id(data_json['data']['object']['customer'])
          @user = @payment.user if @payment.present?
          @payment.handle_failed_payment!
          NotificationMailer.single_use_charge_failed(data_json["data"]["object"], @user).deliver if @user.present?
        end
      end
    end

    if data_json["type"] == "invoice.payment_succeeded"
      @invoice = data_json
      @payment = Payment.find_by_stripe_id(data_json['data']['object']['customer'])
      @user = @payment.user if @payment.present?
      @plan = @invoice['data']['object']['lines']['subscriptions'].first['plan']
      NotificationMailer.recurring_charge_succeeded(@invoice, @user, @plan).deliver if @user.present?
    end

    if data_json["type"] == "invoice.payment_failed"
      @payment = Payment.find_by_stripe_id(data_json['data']['object']['customer'])
      @user = @payment.user if @payment.present?
      @payment.handle_failed_payment!
      NotificationMailer.recurring_charge_failed(@user, data_json, @payment).deliver if @user.present?
    end

    render :text => 'ok', :status => 200
  end
end
