class Admin::MilestonesController < Admin::UsersController
  before_action :set_milestone

  def approve
    @milestone.update_attribute(:approved, true)
    Log.create(loggable: @milestone, description: 'Milestone approved', user: current_user)
    redirect_to admin_company_company_phase_path(@milestone.company_phase.company, @milestone.company_phase)
  end

  def refuse
    @milestone.update_attributes(approved: false, complete: false)
    Log.create(loggable: @milestone, description: 'Milestone rejected', user: current_user)
    redirect_to admin_company_company_phase_path(@milestone.company_phase.company, @milestone.company_phase)
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end
end
