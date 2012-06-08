class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end
  
  def contact
  end
  
  def postevent
  	if signed_in?
  		@event = current_user.events.build
      @payment = current_user.payments.first
    else
      redirect_to root_path
  	end
  end

  def plans
    
  end

end
