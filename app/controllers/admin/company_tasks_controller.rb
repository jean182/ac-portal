class Admin::CompanyTasksController < Admin::AdminBaseController
  def approve
    @task = CompanyTask.where(company_id: params[:company_id].to_i, task_id: params[:company_task_id].to_i).first_or_create
    @task.update_attribute(:approved, true)
    flash[:notice] = "Task approved"
    redirect_to request.referer
  end

  def set_company
    @company ||= Company.find(params[:company_id])
  end

  def company_task_params
    params.require(:company_task).permit(:company_id, :task_id, :approved)
  end
end
