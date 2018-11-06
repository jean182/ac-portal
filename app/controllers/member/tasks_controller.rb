class Member::TasksController < Member::MemberBaseController
  before_action :set_task

  def mark_complete
    @task.update_attribute(:complete, true)
    @task.mentors.each do |mentor|
      NotificationMailer.task_completed_notification(mentor, current_user, @task).deliver_later
    end
    render json: { id: @task.task.id }, status: 200
  end

  def mark_incomplete
    @task.update_attribute(:complete, false)
    render json: { id: @task.task.id  }, status: 200
  end

  private

  def set_task
    @task = CompanyTask.where(task_id: params[:task_id], company_id: current_user.client_info.company_id).first_or_create
  end
end
