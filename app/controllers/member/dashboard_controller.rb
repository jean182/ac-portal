class Member::DashboardController < Member::MemberBaseController

  def show
    @user = current_user
    @company = current_user.client_info.company
    authorize @company
    @phase = @company.company_phases.where(status: 'active').first
    @message = Message.new
  end
end
