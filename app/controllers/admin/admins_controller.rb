class Admin::AdminsController < Admin::UsersController

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
    @admin.build_user
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to(admin_admins_path, notice: 'Admin was successfully created.')
    else
      render action: :new
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.user.soft_delete
    redirect_to admin_admins_path, notice: "Admin deleted."
  end

  def reactivate_admin
    @user = User.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "Admin Activated succesfully"
    redirect_to admin_admins_path
  end

  private

  def admin_params
    params.require(:admin).permit(:description, user_attributes: user_params)
  end
end
