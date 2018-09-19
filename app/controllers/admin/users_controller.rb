class Admin::UsersController < Admin::AdminBaseController
  before_action :authenticate_user!
  before_action :authenticate_admin!, except: :show
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, alert: "Access denied."
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "User deleted."
  end

  private

  def user_params
    %i(
      name
      email
      password
    )
  end
end
