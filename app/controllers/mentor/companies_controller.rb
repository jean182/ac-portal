class Mentor::CompaniesController < Mentor::MentorBaseController
  before_action :set_company, only: [:show]

  def index
    @companies = Company.all
  end

  def show
    @location = @company.location
    @phase = @company.company_phases.with_status(:active).first
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end
end
