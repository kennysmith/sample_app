class SubscriptionsController < ApplicationController
	
def edit
end


def update
      @subscription = current_user.subscription.first


    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end

end

	
end
