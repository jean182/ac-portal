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
      redirect_to(polymorphic_path([:admin, @client]), notice: 'Client was successfully created.')
    else
      render action: :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:description, user_attributes: user_params)
  end
end
