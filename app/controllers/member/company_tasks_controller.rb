class Member::CompanyTasksController < Member::MemberBaseController
  include TaskProgressCalculatorHelper
  before_action :set_task

  def mark_complete
    @company_task.update_attribute(:complete, true)

    @company_task.mentors.each do |mentor|
      NotificationMailer.task_completed_notification(mentor, current_user, @company_task).deliver_later
    end
    render json: { id: @company_task.id }, status: 200
  end

  def mark_incomplete
    @company_task.update_attribute(:complete, false)
    render json: { id: @company_task.task_id }, status: 200
  end

  private

  def set_task
    @company_task = CompanyTask.find(params[:id])
  end
end
