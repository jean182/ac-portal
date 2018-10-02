class Mentor::MentorBaseController < ApplicationController
  before_action :authenticate_mentor!
  def authenticate_mentor!
    return if user_signed_in? && current_user.mentor?

    flash[:error] = "You don't have the permissions to do this!"
    redirect_to root_path
  end
end
