class MessagesController < ApplicationController
  respond_to :html

  def new
    @message = Message.new(company_task_id: params[:company_task_id])
    respond_with_modal(@message)
  end

  def create
    @message = current_user.messages.build(message_params)
    authorize @message
    @task_id = message_params.require(:company_task_id).to_i
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

  private

  def message_params
    params.require(:message).permit(:text, :company_task_id)
  end
end
