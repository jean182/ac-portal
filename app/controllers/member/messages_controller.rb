class Member::MessagesController < Member::MemberBaseController
  def new; end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to request.referer
    else
      render :new
    end
  end

  def message_params
    params.require(:message).permit(:text, :company_task_id, :user_id)
  end
end
