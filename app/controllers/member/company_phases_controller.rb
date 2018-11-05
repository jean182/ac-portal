class Member::CompanyPhasesController < Member::MemberBaseController
  before_action :set_company
  before_action :set_phase, only: [:show]
  before_action :set_message, only: [:show]

  layout 'phase/application'

  def index
    @phase = CompanyPhase.where.not(["company_phases.status = ? and company_id = ?", CompanyPhase.statuses[:inactive], @company.id])
  end

  def show
    @phases = @company.company_phases
  end

  private

  def set_phase
    @phase ||= CompanyPhase.find(params[:id])
  end

  def set_message
    @message = Message.new
  end

  def set_company
    @company ||= current_user.client_info.company
  end
end
