class Mentor::MilestonesController < Mentor::MentorBaseController
  before_action :set_milestone

  def approve
    @milestone.update_attribute(:approved, true)
    Log.create(loggable: @milestone, description: 'Milestone approved', user: current_user)
    @milestone.company_phase.company.clients.each do |client|
      NotificationMailer.milestone_approved_notification(client, current_user, @milestone).deliver_later
    end
    redirect_to mentor_company_company_phase_path(@milestone.company_phase.company, @milestone.company_phase)
  end

  def refuse
    @milestone.update_attributes(approved: false, complete: false)
    Log.create(loggable: @milestone, description: 'Milestone rejected', user: current_user)
    @milestone.company_phase.company.clients.each do |client|
      NotificationMailer.milestone_refused_notification(client, current_user, @milestone).deliver_later
    end
    redirect_to mentor_company_company_phase_path(@milestone.company_phase.company, @milestone.company_phase)
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end
end
