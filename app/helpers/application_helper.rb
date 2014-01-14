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
		
		term_times = collapse_opening_times(term_times)
		vacation_times = collapse_opening_times(vacation_times)
		
		{
			term_times: term_times,
			vacation_times: vacation_times
		}
	end
	
	def collapse_opening_times(opening_times)
		if !opening_times || opening_times.length == 0
			return [] # Return empty for no times
		end
		
		opening_times = opening_times.sort_by(&:day)
		if opening_times.first.day == 0 # Sunday
			opening_times << opening_times.shift # Put it at the back
		end
		
		collapsed_times = [opening_times.shift]
		day_names = [day_name(collapsed_times.first.day)]
		
		opening_times.each do |time|
			if collapsed_times.last.has_same_times(time)
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
	
	def format_open_close_time(time)
		time
	end
end
