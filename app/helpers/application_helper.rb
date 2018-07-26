module ApplicationHelper
	def flash_class(level)
		case level
		when :notice then "alert alert-info"
		when :success then "alert alert-error"
		when :alert then "alet alert-error"
		end
	end
end
