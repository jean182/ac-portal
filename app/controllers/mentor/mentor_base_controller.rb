class Mentor::MentorBaseController < ApplicationController 
  before_action :authenticate_mentor!
  def authenticate_mentor!
    redirect_to root_path, :flash => { :error => "You don't have the permissions to do this!" } unless user_signed_in? && current_user.mentor?
  end
end