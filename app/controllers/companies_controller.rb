class CompaniesController < ApplicationController
  before_action :set_company

  def show; end

  protected

  def set_company
    @company ||= Company.find(params[:id])
    authorize(@company)
  end
end
