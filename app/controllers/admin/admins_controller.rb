class Admin::AdminsController < Admin::UsersController
  before_action :set_admin, only: [:edit, :update]

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if params[:admin][:email].present? && params[:admin][:name].present?
      @admin.save(validate: false)
      @admin.invite!(current_user)
      redirect_to(admin_users_path, notice: 'Admin was successfully created.')
    else
      flash[:error] = "Please complete all the fields"
      render action: :new
    end
  end

  def edit; end

  def update
    if @admin.update(admin_params)
      redirect_to(admin_users_path, notice: 'Admin was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.soft_delete
    redirect_to admin_users_path, notice: "Admin deleted."
  end

  def reactivate_admin
    @user = Admin.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "Admin Activated succesfully"
    redirect_to admin_users_path
  end

  private

  def set_admin
    @admin ||= Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(user_params)
  end
end
