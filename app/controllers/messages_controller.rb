class MessagesController < ApplicationController
  def new; end

  def create
    @message = Message.new(message_params)
    authorize @message
    if @message.save
      @message.company_task.mentors.each do |mentor|
        NotificationMailer.new_task_message(mentor, @message.user, @message.company_task).deliver_later
      end
      redirect_to request.referer
    else
      redirect_to request.referer
      flash[:error] = "Please write something!"
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :company_task_id, :user_id)
  end
end
