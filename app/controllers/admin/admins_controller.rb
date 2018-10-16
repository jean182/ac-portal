class Admin::AdminsController < Admin::UsersController

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if params[:admin][:email].present? && params[:admin][:name].present?
      @admin.save(validate: false)
      @admin.invite!(current_user)
      redirect_to(admin_admins_path, notice: 'Admin was successfully created.')
    else
      render action: :new
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.soft_delete
    redirect_to admin_admins_path, notice: "Admin deleted."
  end

  def reactivate_admin
    @user = Admin.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "Admin Activated succesfully"
    redirect_to admin_admins_path
  end

  private

  def admin_params
    params.require(:admin).permit(user_params)
  end
end
