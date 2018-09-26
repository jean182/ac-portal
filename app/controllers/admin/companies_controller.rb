class Admin::CompaniesController < Admin::AdminBaseController
  require 'admin/states_helper'
  before_action :set_company, except: [:index, :new, :create]

  def index
    @companies = Company.all
  end

  def show
    @location = @company.location
  end

  def new
    @company = Company.new
    @company.build_location
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to(admin_companies_path, notice: 'Company was successfully created.')
    else
      render action: :new
    end
  end

  def edit
    build_has_tags
  end

  def update
    if @company.update(company_params)
      redirect_to(admin_companies_path, notice: 'Company was successfully updated.')
    else
      render :edit
    end
  end

  private

  def set_company
    @company ||= Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :name,
      :logo,
      :description,
      location_attributes: location_params,
      tag_ids: [],
    )
  end

  def location_params
    %i(
      address_line1
      address_line2
      city
      country
      postal_code
      state
    )
  end

  def build_has_tags
    Tag.all.each do |tag|
      @company.has_tags.build(tag_id: tag.id)
    end
  end
end
