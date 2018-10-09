class Member::DashboardController < Member::MemberBaseController
  def show
    @user = current_user
    @company = current_user.client_info.company
  end
end
