class Admin::MentorsController < Admin::UsersController
  before_action :authenticate_user!
  before_action :authenticate_admin!, except: :show
  def index
    @mentors = Mentor.all
  end

  def new
    @mentor = Mentor.new
    @mentor.build_user
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
    @mentor.user.soft_delete
    redirect_to admin_mentors_path, notice: "Mentor deleted."
  end

  def reactivate_mentor
    @user = User.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "Mentor Activated succesfully"
    redirect_to admin_mentors_path
  end

  private

  def mentor_params
    params.require(:mentor).permit(:is_active, user_attributes: user_params, tag_ids: [])
  end
end
