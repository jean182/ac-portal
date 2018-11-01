class Admin::MilestonesController < Admin::UsersController
  before_action :set_milestone

  def approve
    @milestone.update_attribute(:approved, true)
    redirect_to admin_company_company_phase_path(@milestone.company_phase.company, @milestone.company_phase)
  end

  def refuse
    @milestone.update_attributes(approved: false, complete: false)
    redirect_to admin_company_company_phase_path(@milestone.company_phase.company, @milestone.company_phase)
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end
end
