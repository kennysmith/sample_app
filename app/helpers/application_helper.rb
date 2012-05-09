module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Automatically Send Your Event to Over 30 Orange County Event Calendars"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def is_payform(page_title)
  		reg_id = "secondary"
  		else_id = "primary"
  		if page_title == "Sign up"
  			reg_id
        else
        	else_id
        end
	end

	def is_login(page_title)
		log_class = "container"
		unlog_class = "main"
		if page_title == "Sign up"
			log_class
		else
			unlog_class
		end
	end
end
