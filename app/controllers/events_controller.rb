class EventsController < ApplicationController
	before_filter :signed_in_user

	def create
		@event = current_user.events.build(params[:event])
		current = @current_user
		remaining = current.postsremaining
		newremaining = remaining - 1
		if current.postsremaining >= 1
			if @event.save
				current.update_attribute(:postsremaining, newremaining)
				sign_in current
				flash[:success] = "Event has been sent!"
				redirect_to root_path
			else
				render 'static_pages/home'
			end
		else
			redirect_to plansandpricing_path, notice: "Woops! It looks like you've run out of event postings this month.  To continue sending your event, you must purchase one of the options below:"
		end
	end


end

