class Admin::CompanyPhasesController < Admin::AdminBaseController
  before_action :set_company
  before_action :set_phase, only: [:show, :edit, :update]

  layout 'phase/application'

  def index
    @phase = CompanyPhase.where.not(["company_phases.status = ? and company_id = ?", CompanyPhase.statuses[:inactive], @company.id])
  end

  def show
    @phases = @company.company_phases.order(:phase_id)
  end

  def edit; end

  def update
    @phase.update(phase_params)
    redirect_to(admin_company_company_phase_path, notice: 'Company was successfully updated.')
  end

  private

  def set_phase
    @phase ||= CompanyPhase.find(params[:id])
  end

  def set_company
    @company ||= Company.find(params[:company_id])
  end

  def phase_params
    params.require(:company_phase).permit(:learning_objectives, milestones_attributes: [:id, :title])
  end
end
