module Admin
  class InfosController < Admin::ApplicationController
    before_action :set_info, only: [:show, :edit, :update, :destroy]

    def index
      @infos = Info.all
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

    private

      def set_info
        @info = Info.find(params[:id])
      end

      def info_params
        params.fetch(:info).permit(:title, :content)
      end
  end
end