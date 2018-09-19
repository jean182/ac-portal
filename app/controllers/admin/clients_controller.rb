class Admin::ClientsController < Admin::UsersController

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
    @client.build_user
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to(admin_clients_path, notice: 'Client was successfully created.')
    else
      render action: :new 
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to admin_clients_path, notice: "Client deleted."
  end

  private

  def client_params
    params.require(:client).permit(:description, user_attributes: user_params)
  end
end