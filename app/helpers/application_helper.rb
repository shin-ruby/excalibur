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

	def is_active_controller(controller_name)
    params[:controller] == controller_name ? "active" : nil
  end

	def is_active_actions(action_names)
    params[:action] == action_name ? "active" : nil
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"   # Green
      when "error"
        "alert-danger"    # Red
      when "alert"
        "alert-warning"   # Yellow
      when "notice"
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

end
