module Admin
  class UsersController < Admin::BaseController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @q = User.ransack(params[:q])
      @pagy, @users = pagy(@q.result)
    end

    def show
    end

    def new
      @user ||= User.new
    end

    def edit
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @user.destroy

      redirect_to admin_users_url, notice: 'User was successfully destroyed.'
    end

    private

    def set_user
      @user ||= User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :username, :email, :subscription_id, :admin)
    end
  end
end
