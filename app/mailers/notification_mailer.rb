class NotificationMailer < ActionMailer::Base
  default :from => "contact@mhbweb.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

  def single_use_charge_succeeded(charge, user)
    @charge = charge
    @user = user
    subject = "#{@charge["description"]} Succeeded"
    mail(:to => @user.email, :subject => subject)
  end

  def single_use_charge_failed(charge, user)
    @charge = charge
    @user = user
    subject = "#{@charge["description"]} Failed"
    mail(:to => @user.email, :subject => subject)
  end

  def recurring_charge_succeeded(invoice, user, plan)
    @user = user
    @plan = plan
    @invoice = invoice
    subject = "Recurring Charge Succeeded for #{@plan['name']} Plan"
    mail(:to => @user.email, :subject => subject)
  end

  def recurring_charge_failed(user, invoice, payment)
    @invoice = invoice
    @user = user
    @payment = payment
    subject = "Recurring Charge Failed for #{@user.plan.name} Plan"
    mail(:to => @user.email, :subject => subject)
  end
end