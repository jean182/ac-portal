class Admin::AdminBaseController < ApplicationController
  before_action :authenticate_admin!

  def authenticate_admin!
    return if user_signed_in? && current_user.admin?

    flash[:error] = "You don't have the permissions to do this!"
    redirect_to root_path
  end
end
