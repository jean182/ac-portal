class Admin::TimeTrackingsController < Admin::AdminBaseController
  before_action :set_company, only: [:index, :track_company_time]
  def index
    @time_trackings = @company.time_trackings
    @total_time = 0
    @time_trackings.each do |time_tracking|
      @total_time += time_tracking.hours_spent
    end
    respond_to do |format|
      format.html
      format.csv { 
        send_data @time_trackings.to_csv(['Date', 'Hours Spent', 'Company', 'Mentor']),
        filename: "#{@company.name}-#{Date.today}.csv"
      }
    end
  end

  def track_mentor_time
    @mentor = Mentor.find(params[:mentor_id])
    @time_trackings = @mentor.time_trackings
    respond_to do |format|
      format.html {
        redirect_to admin_users_path
      }
      format.csv { 
        send_data @time_trackings.to_csv(['Date', 'Hours Spent', 'Company', 'Mentor']),
        filename: "#{@mentor.email}-#{Date.today}.csv"
      }
    end
  end

  def track_company_time
    @time_trackings = @company.time_trackings
    respond_to do |format|
      format.csv { 
        send_data @time_trackings.to_csv(['Date', 'Hours Spent', 'Company', 'Mentor']),
        filename: "#{@company.name}-#{Date.today}.csv"
      }
    end
  end

  private

  def set_company
    @company ||= Company.find(params[:company_id])
  end
end
