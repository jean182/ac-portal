class Admin::ClientsController < Admin::UsersController
  before_action :set_client, only: [:edit, :update]

  def new
    @client = Client.new
    @client.build_client_info
  end

  def create
    @client = Client.new(client_params)
    if params[:client][:email].present? && params[:client][:name].present?
      @client.save(validate: false)
      @client.invite!(current_user)
      redirect_to(admin_users_path, notice: 'Client was successfully created.')
    else
      flash[:error] = "Please complete all the fields"
      render action: :new
    end
  end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to(admin_users_path, notice: 'Client was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.soft_delete
    redirect_to admin_users_path, notice: "Client deleted."
  end

  def reactivate_client
    @user = User.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "Client Activated succesfully"
    redirect_to admin_users_path
  end

  private

  def set_client
    @client ||= Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(user_params, client_info_attributes: [:id, :description, :company_id])
  end
end
