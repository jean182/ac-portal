class Admin::UsersController < Admin::AdminBaseController
  before_action :authenticate_user!
  before_action :authenticate_admin!, except: :show
  before_action :configure_permitted_parameters, if: :devise_controller?
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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def user_params
    %i(
      name
      phone
      email
      password
    )
  end
end
