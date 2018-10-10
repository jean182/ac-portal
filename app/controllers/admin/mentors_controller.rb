class Admin::MentorsController < Admin::UsersController
  before_action :authenticate_user!
  before_action :authenticate_admin!, except: :show

  def index
    @mentors = Mentor.all
  end

  def new
    @mentor = Mentor.new
    @mentor.build_mentor_info
  end

  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save
      redirect_to(admin_mentors_path, notice: 'Mentor was successfully created.')
    else
      render action: :new
    end
  end

  def destroy
    @mentor = Mentor.find(params[:id])
    @mentor.soft_delete
    redirect_to admin_mentors_path, notice: "Mentor deleted."
  end

  def reactivate_mentor
    @user = Mentor.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "Mentor Activated succesfully"
    redirect_to admin_mentors_path
  end

  private

  def mentor_params
    params.require(:mentor).permit(user_params, mentor_info_attributes: [:is_active], tag_ids: [])
  end
end
