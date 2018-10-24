class WelcomeController < ApplicationController
  before_action :redirect_if_logged_in

  def index; end

  private

  def redirect_if_logged_in
    return unless current_user.present?
    flash[:notice] = "You are already signed in"
    if current_user.is_a?(Admin)
      redirect_to admin_root_path
    elsif current_user.is_a?(Mentor)
      redirect_to mentor_root_path
    elsif current_user.is_a?(Client)
      redirect_to member_root_path
    end
  end
end
