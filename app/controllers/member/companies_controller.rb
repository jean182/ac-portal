class Member::CompaniesController < Member::MemberBaseController
  before_action :set_company
  before_action :authorize_company

  def show; end

  protected

  def set_company
    @company ||= Company.find(params[:id])
    @client = current_user
  end

  def authorize_company
    authorize @company
  end
end
