class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotDefinedError, with: :user_not_logged

  # private def user_not_authorized

  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(request.referrer || root_path)
  # end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    elsif resource.mentor?
      mentor_root_path
    elsif resource.client?
      company_path(resource.account.company)
    end
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end

  def user_not_logged
    flash[:error] = "Please login with a current client."
    redirect_to(request.referer || root_path)
  end
end
