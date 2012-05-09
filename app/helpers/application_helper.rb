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
  		if page_title == "Sign up"
  			false
  		else
  			true
  		end
	end

end
