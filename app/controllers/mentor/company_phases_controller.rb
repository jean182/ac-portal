class Mentor::CompanyPhasesController < Mentor::MentorBaseController
  before_action :set_company
  before_action :set_phase, only: [:show, :edit, :update]
  before_action :set_message, only: [:show, :edit, :update]

  layout 'phase/application'

  def index
    @phase = CompanyPhase.where.not(["company_phases.status = ? and company_id = ?", CompanyPhase.statuses[:inactive], @company.id])
  end

  def show
    @phases = @company.company_phases
  end

  def edit; end

  def update
    @phase.update(phase_params)
    redirect_to(mentor_company_company_phase_path, notice: 'Company was successfully updated.')
  end

  private

  def set_phase
    @phase ||= CompanyPhase.find(params[:id])
  end

  def set_company
    @company ||= Company.find(params[:company_id])
  end

  def set_message
    @message = Message.new
  end

  def phase_params
    params.require(:company_phase).permit(milestones_attributes: [:id, :title], phase_attributes: [:id, :learning_objectives])
  end
end
