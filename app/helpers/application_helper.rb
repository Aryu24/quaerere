module ApplicationHelper

	def converting_comma(price)
		"#{price.to_s(:delimited, delimiter: ',')}"
	end

	def simple_time(time)
		time.strftime("%Y-%m-%d %H:%M ")
	end
end
