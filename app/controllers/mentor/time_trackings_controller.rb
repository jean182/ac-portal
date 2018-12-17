class Mentor::TimeTrackingsController < Mentor::MentorBaseController
  def index
    @time_trackings = current_user.time_trackings
    respond_to do |format|
      format.html
      format.csv { 
        send_data @time_trackings.to_csv(['Date', 'Hours Spent', 'Company', 'Mentor', 'Notes']),
        filename: "#{current_user.name}-#{Date.today}.csv"
      }
    end
  end

  def new
    @time_tracking = current_user.time_trackings.new
  end

  def create
    @time_tracking = current_user.time_trackings.new(time_tracking_params)
    if @time_tracking.save
      redirect_to(mentor_time_trackings_path, notice: 'Time Tracking was successfully created.')
    else
      render :new
    end
  end

  private

  def time_tracking_params
    params.require(:time_tracking).permit(:hours_spent, :date, :notes, :company_id)
  end
end
