class Member::MemberBaseController < ApplicationController
  before_action :authenticate_client!

  layout 'member/application'

  def authenticate_client!
    return if user_signed_in? && current_user.client?

    flash[:error] = "You don't have the permissions to do this!"
    redirect_to root_path
  end

  private

  def user_params
    %i(
      name
      phone
      email
      password
      type
    )
  end
end
