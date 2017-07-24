module Admin::UploadsHelper

  private

  def uptoken
  	bucket = 'shin'
  	key = nil

  	put_policy = Qiniu::Auth::PutPolicy.new(
	    bucket,
	    key,   
	    3600
		)

		put_policy.return_body = '{"filename": $(fname), "filesize": $(fsize), "key": $(key), "width": $(imageInfo.width), "height": $(imageInfo.height)}'

		return Qiniu::Auth.generate_uptoken(put_policy)
  end

end
