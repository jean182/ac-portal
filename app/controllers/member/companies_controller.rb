class Member::CompaniesController < Member::MemberBaseController
  before_action :check_company, :set_company

  def show; end

  protected

  def set_company
    @company ||= Company.find(params[:id])
    @client = current_user
  end

  def check_company
    return if params[:id].to_i == current_user.client_info.company.id
    flash[:error] = "You are not allowed to perform this action"
    redirect_to member_root_path
  end
end
