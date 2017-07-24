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

  def qiniu_image_url(upload, format = :square)
		# url = "http://op61r3aq7.bkt.clouddn.com/#{upload.picurl}"
		url = "http://shin.ftghub.com/#{upload.qiniu_hash}"
		case format
		when :square
		   url << '?imageView2/1/w/100/h/100/q/90'
		when :preview
		   url << '?imageView2/2/w/1000/h/1000/q/90'
		else
		   url
		 end
	end

	def qiniu_image_print_url
		url = "http://shin.ftghub.com/#{@upload.qiniu_hash}"
	end

end
