class EventsController < ApplicationController
	before_filter :signed_in_user

	def create
		@event = current_user.events.build(params[:event])
		@subscription = @current_user.subscriptions.first
		current = @current_user
		remaining = @subscription.eventsremaining
		if remaining >= 1
			if @event.save
				response = @subscription.decrease_event_count
				sign_in current
				flash[:success] = "Event has been sent!"
				redirect_to root_path
			else
				render 'static_pages/home'
			end
		else
			redirect_to upgrade_path, notice: "Woops! It looks like you've run out of event postings this month.  To continue sending your event, you must purchase one of the options below:"
		end
	end


end

