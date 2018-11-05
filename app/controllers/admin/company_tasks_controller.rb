class Admin::CompanyTasksController < Admin::AdminBaseController
  def approve
    @task = CompanyTask.find_by(company_id: params[:company_id].to_i, task_id: params[:company_task_id].to_i)
    @task.update_attribute(:approved, true)
    Log.create(loggable: @task, description: 'Task approved', user: current_user)
    flash[:notice] = "Task approved"
    redirect_to request.referer
  end

  def refuse
    @task = CompanyTask.find_by(company_id: params[:company_id].to_i, task_id: params[:company_task_id].to_i)
    @task.update_attribute(:approved, false)
    Log.create(loggable: @task, description: 'Task rejected', user: current_user)
    flash[:notice] = "Task rejected"
    redirect_to request.referer
  end

  private

  def set_company
    @company ||= Company.find(params[:company_id])
  end

  def company_task_params
    params.require(:company_task).permit(:company_id, :task_id, :approved)
  end
end
