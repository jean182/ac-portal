class Admin::ClientsController < Admin::UsersController

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
    @client.build_client_info
  end

  def create
    @client = Client.new(client_params)
    if params[:client][:email].present? && params[:client][:name].present?
      @client.save(validate: false)
      @client.invite!(current_user)
      redirect_to(admin_clients_path, notice: 'Client was successfully created.')
    else
      render action: :new
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.soft_delete
    redirect_to admin_clients_path, notice: "Client deleted."
  end

  def reactivate_client
    @user = User.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "Client Activated succesfully"
    redirect_to admin_clients_path
  end

  private

  def client_params
    params.require(:client).permit(user_params, client_info_attributes: [:description])
  end
end
