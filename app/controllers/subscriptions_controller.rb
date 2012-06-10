class SubscriptionsController < ApplicationController
	
  def edit
    @user = current_user
  end

  def upgrade
    @user = current_user
    @payment = @user.payments.first
    @subscription = @user.subscriptions.first
    if @payment.upgrade && @subscription.upgrade
      flash[:success] = "Successfully Upgraded"
      redirect_to @user
    end
  rescue Stripe::StripeError => e
    logger.error e.message
    redirect_to upgrade_path, :notice => e.message
  end

  def downgrade
    @user = current_user
    @payment = @user.payments.first
    @subscription = @user.subscriptions.first
    if @payment.downgrade && @subscription.downgrade
      flash[:success] = "Successfully Downgraded"
      redirect_to @user
    end
  rescue Stripe::StripeError => e
    logger.error e.message
    redirect_to root_path, :notice => e.message
  end

  def show
    @subscription = @user.subscriptions.first
  end

  def update
    @subscriptions = current_user.subscriptions.first
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end

  end

	
end
