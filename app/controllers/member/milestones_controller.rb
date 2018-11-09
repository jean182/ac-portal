class Member::MilestonesController < Member::MemberBaseController
  include MilestoneProgressCalculatorHelper
  include ActionView::Helpers::NumberHelper
  before_action :set_milestone
  before_action :authorize_milestone

  def mark_complete
    @milestone.update_attribute(:complete, true)
    Admin.find_each do |admin|
      NotificationMailer.milestone_completed_notification(admin, current_user, @milestone).deliver_later
    end
    render json: { id: @milestone.id, completeness_rate: calculate_progress(@milestone.company_phase.milestones) }, status: 200
  end

  def mark_incomplete
    @milestone.update_attribute(:complete, false)
    render json: { id: @milestone.id, completeness_rate: calculate_progress(@milestone.company_phase.milestones) }, status: 200
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end

  def authorize_milestone
    authorize @milestone
  end
end
