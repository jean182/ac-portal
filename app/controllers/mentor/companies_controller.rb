class Mentor::CompaniesController < Mentor::MentorBaseController
  before_action :set_company, only: [:show]

  def index
    @mentor = current_user.account
    @companies = Company.all.where(mentor: @mentor)
  end

  def show
    @phase = Phase.all.where(company_id: @company.id).find_by status: 'active'
    @milestones = @phase.milestones
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end
end
