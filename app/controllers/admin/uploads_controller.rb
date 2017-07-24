module Admin
	class UploadsController < Admin::ApplicationController
		include UploadsHelper
		before_action :logged_in_user

	  def index
	  	@uploads = Upload.all

	    @uptoken = uptoken

	  end

	  def new
	  	@uptoken = generate_qiniu_upload_token
	  	@uploads = Upload.new
	  end

	  def create

	  	upload_ret = JSON.parse(Base64.urlsafe_decode64(params[:upload_ret]))
	    @upload = Upload.new(
	      filename: upload_ret['fname'],
	      picurl: upload_ret['hash'],
	      qiniu_hash: upload_ret['hash']
	    )

	    if @upload.save
      	redirect_to admin_uploads_url, notice: 'Picture was successfully created.'
      else
      	render :new
      end
	  end

	  def qiniu
	  	# byebug
	  end

    def destroy
    	@upload = Upload.find(params[:id])
	  	@upload.destroy
      respond_to do |format|
        format.html { redirect_to admin_uploads_url, notice: '删除成功' }
      end
	  end

	  private

		  def generate_qiniu_upload_token

	      bucket = "shin"

	      put_policy = Qiniu::Auth::PutPolicy.new(bucket)

	      # put_policy.save_key = 'test/2017/${fname}'

			  # callback_url = 'http://shin.ftghub.com/callback'
			  # callback_body = 'filename=$(fname)&filesize=$(fsize)'
			  # put_policy.callback_url= callback_url
				# put_policy.callback_body= callback_body

	      put_policy.return_body = {
	        fname: '$(fname)',
	        hash: '$(etag)'
	        # key: '$(key)'
	      }.to_json
	      put_policy.return_url = create_admin_uploads_url
	      Qiniu::Auth.generate_uptoken(put_policy)
	    end

		  def upload_params
	      params.require(:upload).permit(:filename, :picurl, :qiniu_hash)
	    end

	end
end
