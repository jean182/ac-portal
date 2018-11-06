class Admin::CompanyTasksController < Admin::AdminBaseController
  before_action :set_company_task

  def approve
    @task.update_attribute(:approved, true)
    Log.create(loggable: @task, description: 'Task approved', user: current_user)
    flash[:notice] = "Task approved"
    redirect_to admin_company_company_phase_path(@task.company, @task.company.current_phase)
  end

  def refuse
    @task.update_attributes(approved: false, complete: false)
    Log.create(loggable: @task, description: 'Task rejected', user: current_user)
    flash[:notice] = "Task rejected"
    redirect_to admin_company_company_phase_path(@task.company, @task.company.current_phase)
  end

  private

  def set_company_task
    @task = CompanyTask.find_by(company_id: params[:company_id].to_i, task_id: params[:company_task_id].to_i)
  end
end
