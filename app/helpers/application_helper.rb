module ApplicationHelper
	def flash_class(level)
		case level
			when :notice then "info"
			when :success then "success"
			when :error then "warning"
			when :alert then "warning"
		end
	end
	
	###
	# Support for rendering schedules and opening times
	###
	
	def renderable_schedule(schedule)
		term_times = schedule.opening_times.find_all { |o| !o.vacation }
		vacation_times = schedule.opening_times.find_all { |o| o.vacation }
		
		term_service_times = term_times.find_all { |o| o.service_start || o.service_end }
		vacation_service_times = vacation_times.find_all { |o| o.service_start || o.service_end }
		
		term_times = collapse_opening_times(term_times)
		vacation_times = collapse_opening_times(vacation_times)
		
		term_service_times = collapse_service_times(term_service_times)
		vacation_service_times = collapse_service_times(vacation_service_times)
		
		{ term_times: term_times, vacation_times: vacation_times,
		  term_service: term_service_times, vacation_service: vacation_service_times	}
	end
	
	def format_open_close_time(time)
		hours = time / 100
		minutes = time - (100 * hours)
		time = Time.new(0, nil, nil, hours, minutes)
		time.strftime "%l:%M%P"
	end
	
	def field_error_class(resource, field)
		resource.errors[field].empty? ? "" : "error"
	end
	
	def field_error(resource, field, name)
		unless resource.errors[field].empty?
			raw("<small>#{name} #{resource.errors[field].first}</small>")
		end
	end

	def pluralize_without_count(count, string)
		count == 1 ? string : string.pluralize
	end
	
private

	###
	# Helper methods for opening times formatting
	###
	
	def collapse_opening_times(opening_times)
		collapse_times(opening_times, compare = :opening)	
	end
	
	def collapse_service_times(opening_times)
		collapse_times(opening_times, compare = :service)	
	end
	
	def collapse_times(opening_times, compare = :opening)
		if !opening_times || opening_times.length == 0
			return [] # Return empty for no times
		end
		
		opening_times = opening_times.sort_by(&:day)
		if opening_times.first.day == 0 # Sunday
			opening_times << opening_times.shift # Put it at the back
		end
		
		collapsed_times = [opening_times.shift]
		day_names = [day_name(collapsed_times.first.day)]
		
		comparator = nil
		if compare == :opening
			comparator = lambda { |t1, t2| t1.has_same_times(t2) }
		elsif compare == :service
			comparator = lambda { |t1, t2| t1.has_same_service(t2) }
		else
			return []
		end
		
		opening_times.each do |time|
			if comparator.call(collapsed_times.last, time)
				day_names << (day_names.pop + ',' + day_name(time.day))
			else
				collapsed_times << time
				day_names << day_name(time.day)
			end
		end
		
		collapsed_times.each_with_index.map do |time, i|
			{ opening_time: time, text_display: collapse_day_list(day_names[i]) }
		end
	end
	
	def day_name(day_number)
		Date::DAYNAMES[day_number]
	end
	
	def collapse_day_list(day_list)
		days = day_list.split(',')
		
		if days.length > 1
			"#{days.first} \u2013 #{days.last}"
		else
			day_list
		end
	end
	
end
