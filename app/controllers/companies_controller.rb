class CompaniesController < ApplicationController
  before_action :set_company, :authenticate_client!
  def show; end

  def authenticate_client!
    redirect_to root_path, flash: { error: "You don't have the permissions to do this!" } unless user_signed_in? && current_user.client?
  end

  private

  def set_company
    @company ||= current_user.account.company
  end
end
