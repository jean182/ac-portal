class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    elsif resource.mentor?
      mentor_root_path
    elsif resource.client?
      company_path(resource.account.company_id)
    end
  end

  # def authenticate_mentor!
  #   redirect_to root_path, :flash => { :error => "You don't have the permissions to do this!" } unless user_signed_in? && current_user.mentor?
  # end

  # def authenticate_client!
  #   redirect_to root_path, :flash => { :error => "You don't have the permissions to do this!" } unless user_signed_in? && current_user.client?
  # end
end
