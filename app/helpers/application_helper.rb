module ApplicationHelper

	def converting_comma(price)
		"#{price.to_s(:delimited, delimiter: ',')}"
	end
end
