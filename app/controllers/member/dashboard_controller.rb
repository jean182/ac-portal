class Member::DashboardController < Member::MemberBaseController
  def show
    @user = current_user
    @company = current_user.account.company
  end
end
