class Admin::UsersController < Admin::AdminBaseController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @clients = Client.all
    @admins = Admin.all
    @mentors = Mentor.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.soft_delete
    redirect_to admin_users_path, notice: "User deleted."
  end

  def send_reset_password_instructions
    @user = User.find(params[:id])
    @user.send_reset_password_instructions
    flash[:notice] = "Sent reset password instructions to user"
    redirect_to admin_users_path
  end

  def reactivate_user
    @user = User.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "User Activated succesfully"
    redirect_to admin_users_path
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
      type
    )
  end
end
