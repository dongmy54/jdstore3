module ApplicationHelper

	def collections_count
		if current_user.blank?
			return 0
			else
				return current_user.collections_count
		end
	end

end
