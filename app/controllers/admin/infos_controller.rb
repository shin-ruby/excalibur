module Admin
  class InfosController < Admin::ApplicationController
    @@picture_all = []
    before_action :set_info, only: [:show, :edit, :update, :destroy]

    def index
      @infos = Info.paginate(page: params[:page])
    end

    def show
    end

    def new
      @info = Info.new
    end

    def edit
    end

    def create
      sleep 3
      @info = Info.new(info_params)
    
      respond_to do |format|
        if @info.save
          @@picture_all.each do |picture|
            picture.info_id = @info.id
            picture.save
          end

          format.html { redirect_to admin_info_url(@info), notice: '创建新闻成功' }
          format.json { render :show, status: :created, location: @info }
        else
          format.html { render :new }
          format.json { render json: @info.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      sleep 3
      respond_to do |format|
        if @info.update(info_params)
          @@picture_all.each do |picture|
            picture.info_id = @info.id
            picture.save
          end
          format.html { redirect_to admin_info_url(@info), notice: '更新新闻成功' }
          format.json { render :show, status: :ok, location: @info }
        else
          format.html { render :edit }
          format.json { render json: @info.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @info.destroy
      respond_to do |format|
        format.html { redirect_to admin_infos_url, notice: '删除成功' }
        format.json { head :no_content }
      end
    end

    def upload
      @picture = Picture.new
      @picture.image = params[:upload_file]
      @@picture_all << @picture

      success = true
      msg = '上传成功'
      file_path = ''
      if @picture.save!
        success=true
        render json: { :success=> success, :msg=>msg, :file_path=> @picture.image.url }
      else
        success=false
        render json: { :success=> false }
      end
    end

    private

      def set_info
        @info = Info.find(params[:id])
      end

      def info_params
        params.fetch(:info).permit(:title, :content)
      end
  end
end