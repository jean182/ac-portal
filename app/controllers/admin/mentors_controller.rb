class Admin::MentorsController < Admin::UsersController
  before_action :authenticate_user!
  before_action :authenticate_admin!, except: :show
  before_action :set_mentor, only: [:edit, :update, :show]

  def new
    @mentor = Mentor.new
    @mentor.build_mentor_info
  end

  def create
    @mentor = Mentor.new(mentor_params)
    @mentor.skip_password_validation = true
    if @mentor.valid?
      @mentor.save
      @mentor.invite!(current_user)
      redirect_to(admin_users_path, notice: 'Mentor was successfully created.')
    else
      render action: :new
    end
  end

  def show; end

  def destroy
    @mentor = Mentor.find(params[:id])
    @mentor.soft_delete
    redirect_to admin_users_path, notice: "Mentor deleted."
  end

  def reactivate_mentor
    @user = Mentor.find(params[:id])
    @user.update_attribute(:deleted_at, nil)
    flash[:notice] = "Mentor Activated succesfully"
    redirect_to admin_users_path
  end

  def edit
    build_has_tags
  end

  def update
    if @mentor.update(mentor_params)
      redirect_to(admin_users_path, notice: 'Mentor was successfully updated.')
    else
      render :edit
    end
  end

  private

  def set_mentor
    @mentor ||= Mentor.find(params[:id])
  end

  def mentor_params
    params.require(:mentor).permit(user_params, tag_ids: [])
  end

  def build_has_tags
    Tag.all.each do |tag|
      @mentor.has_tags.build(tag_id: tag.id)
    end
  end
end
