class Member::MilestonesController < Member::MemberBaseController
  include MilestoneProgressCalculatorHelper
  include ActionView::Helpers::NumberHelper
  before_action :set_milestone

  def mark_complete
    @milestone.update_attribute(:complete, true)
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
end