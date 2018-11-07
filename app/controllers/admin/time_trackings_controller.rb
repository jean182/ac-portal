class Admin::TimeTrackingsController < Admin::AdminBaseController
  before_action :set_company
  def index
    @time_trackings = @company.time_trackings
    @total_time = 0
    @time_trackings.each do |time_tracking|
      @total_time += time_tracking.hours_spent
    end
  end

  private

  def set_company
    @company ||= Company.find(params[:company_id])
  end
end
