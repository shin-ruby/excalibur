module ApplicationHelper

	def full_title(page_title = '')
		base_title = "Excalibur CMS"
		if page_title.empty?
			base_title
		else
			page_title + ' | ' + base_title
		end
	end

	def admin_full_title(page_title = '')
		base_title = "Bashboard"
		if page_title.empty?
			base_title
		else
			page_title + ' | ' + base_title
		end
	end

end
