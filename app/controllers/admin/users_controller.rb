module Admin
  class UsersController < Admin::ApplicationController
    before_action :logged_in_user
    
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = User.all
      @user = User.new
    end

    def show
    end

    def new
      @user = User.new
    end

    def edit
      respond_to do |format|
        format.html
        format.json { render json: @user, status: :ok, location: admin_user_path(@user) }
      end
    end

    def create
      sleep 2
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
          # format.json { render :show, status: :created, location: @user }
          format.js
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity, notice: 'User was successfully created.' }
          format.js { render json: @user.errors.full_messages.join(', '), status: :unprocessable_entity }
        end
      end
    end

    def update
      sleep 2
      respond_to do |format|

        if @user.update(user_params)
          format.html { redirect_to admin_users_url, notice: 'User was successfully updated.' }
          format.json { render json: @user, status: :ok, location: admin_user_path(@user) }
        else
          format.html { render :edit }
          format.json { render json: @user.errors.full_messages.join(', '), status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
        format.js
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.fetch(:user).permit(:name, :email, :password, :password_confirmation)
      end
  end
end
