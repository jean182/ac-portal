class MessagesController < ApplicationController
  respond_to :html
  before_action :set_message, only: :destroy

  def new
    @message = Message.new(company_task_id: params[:company_task_id])
    respond_with_modal(@message)
  end

  def create
    @message = current_user.messages.build(message_params)
    authorize @message
    @task_id = message_params.require(:company_task_id).to_i
    @task = CompanyTask.find(@task_id)
    respond_to do |format|
      if @message.save
        @message.company_task.mentors.each do |mentor|
          NotificationMailer.new_task_message(mentor, @message.user, @message.company_task).deliver_later
        end
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    authorize @message
    if @message.destroy
      flash[:success] = "Deleted succesfully."
      redirect_to request.referer
    else
      flash[:error] = "Could not process your request"
    end
  end

  private

  def set_message
    @message ||= Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:text, :company_task_id)
  end
end
