class Member::PhasesController < Member::MemberBaseController
  before_action :set_company
  before_action :set_phase, except: :index
  before_action :set_progress, only: :show

  def index
    @phases_completed = @company.phases.where(status: 'completed')
    @phase = @company.phases.find_by(status: 'active')
  end

  def show; end

  def update
    if @phase.update(phase_params)
      flash[:success] = 'Milestones updated succesfully'
      redirect_to member_phase_path(@phase)
    else
      flash[:error] = 'Error'
    end
  end

  def set_progress
    total = @phase.milestones.count
    num = @phase.milestones.where(complete: true).count
    @percentage = (num * 100) / total.to_f
  end

  private

  def phase_params
    params.require(:phase).permit(milestones_attributes: [:id, :title, :complete, :_destroy])
  end

  def set_company
    @company = current_user.client_info.company
  end

  def set_phase
    @phase ||= @company.phases.find(params[:id])
  end
end
