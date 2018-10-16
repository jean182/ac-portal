class Member::ClientsController < Member::MemberBaseController

  before_action :set_company

  def index
    @clients = @company.clients
  end

  def new
    @client = Client.new
    @client.build_client_info()
  end

  def create
    @client = Client.new(client_params)
    if params[:client][:email].present? && params[:client][:name].present?
      @client.save(validate: false)
      @client.client_info.update_attributes(company_id: @company.id)
      @client.invite!(current_user)
      redirect_to(member_clients_path, notice: 'Client was successfully invited.')
    else
      render action: :new
    end
  end

  private

  def set_company
    @company = current_user.client_info.company
  end

  def client_params
    params.require(:client).permit(user_params, client_info_attributes: [:id, :description, :company_id])
  end
end
