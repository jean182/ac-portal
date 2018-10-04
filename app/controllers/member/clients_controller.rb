class Member::ClientsController < Member::MemberBaseController
  before_action :set_current_client, :check_client_owner
  def index
    @clients = policy_scope(Client)
  end

  def new
    @client = Client.new
    @client.build_user
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
    @client.user.soft_delete
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
    params.require(:client).permit(:company_id, :description, user_attributes: user_params)
  end

  def set_current_client
    @client = current_user.account if current_user.present?
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
    return if params[:company_id].to_i == @client.company.id
    flash[:error] = "You are not allowed to perform this action"
    redirect_to mentor_root_path
  end

end
