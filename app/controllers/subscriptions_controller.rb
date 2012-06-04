class SubscriptionsController < ApplicationController
	
def edit
  @user = current_user
  @subscription = @user.subscriptions.first
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
