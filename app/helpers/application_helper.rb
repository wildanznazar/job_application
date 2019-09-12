module ApplicationHelper
	def currency(val)
		number_to_currency(val.to_i, unit: "Rp", separator: ",", delimiter: ".")
	end

	def flash_class(level)
	  case level.to_sym
      when :notice then "alert alert-info alert-dismissible"
      when :success then "alert alert-success alert-dismissible"
      when :alert then "alert alert-warning alert-dismissible"
      when :error then "alert alert-danger alert-dismissible"
	  end
	end
end
