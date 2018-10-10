class Member::ClientsController < Member::MemberBaseController
  before_action :set_current_client, :check_client_owner

  def index
    @clients = policy_scope(Client)
  end

  def new
    @client = Client.new
    @client.build_client_info
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to(member_company_clients_path, notice: 'Client was successfully created.')
    else
      render action: :new
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.soft_delete
    redirect_to member_company_clients_path, notice: "Client deleted."
  end

  def reactivate_client
    @user = User.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "Client Activated succesfully"
    redirect_to member_company_clients_path
  end

  private

  def client_params
    params.require(:client).permit(user_params, client_info_attributes: [:company_id, :description])
  end

  def set_current_client
    @client = current_user
  end

  def user_params
    %i(
      name
      phone
      email
      password
    )
  end

  def check_client_owner
    return if params[:client_info_attributes][:company_id].to_i == @client.client_info.company.id
    flash[:error] = "You are not allowed to perform this action"
    redirect_to mentor_root_path
  end

end
