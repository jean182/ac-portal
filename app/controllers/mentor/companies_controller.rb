class Mentor::CompaniesController < Mentor::MentorBaseController
  before_action :set_company, :set_phase, only: [:show]

  def index
    @mentor = current_user.account
    @companies = Company.all.where(mentor: @mentor)
  end

  def show
    @phases = Phase.all.where(company_id: @company.id)
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def set_phase
    @phase = Phase.find(params[:id])
  end
end
