class Member::DashboardController < Member::MemberBaseController

  layout 'phase/application'

  def show
    @user = current_user
    @company = current_user.client_info.company
    authorize @company
    @phase = @company.company_phases.where(status: 'active').first
    @phases = @company.company_phases
    @message = Message.new
  end
end
