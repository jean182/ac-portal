class Admin::AdminBaseController < ApplicationController
  before_action :authenticate_admin!
  def authenticate_admin!
    redirect_to root_path, flash: { error: "You don't have the permissions to do this!" } unless user_signed_in? && current_user.admin?
  end
end
