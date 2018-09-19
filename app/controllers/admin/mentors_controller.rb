class Admin::MentorsController < Admin::UsersController
  before_action :authenticate_user!
  before_action :authenticate_admin!, except: :show
  def index
    @users = Mentor.all
  end

  def new
    @mentor = Mentor.new
    @mentor.build_user
  end

  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save
      redirect_to(polymorphic_path([:admin, @mentor]), notice: 'Mentor was successfully created.')
    else
      render action: :new
    end
  end

  # def create
  #   @mentor = User.new(secure_params)
  #   if @mentor.save
  #     redirect_to(polymorphic_path([:admin, @mentor]), :notice => 'User was successfully created.')
  #   else
  #     render :action => :new
  #   end
  # end

  # def show
  #   @mentor = User.find(params[:id])
  #   unless current_user.admin?
  #     unless @mentor == current_user
  #       redirect_to root_path, :alert => "Access denied."
  #     end
  #   end
  # end

  # def update
  #   @mentor = User.find(params[:id])
  #   if @mentor.update_attributes(secure_params)
  #     redirect_to admin_mentors_path, :notice => "User updated."
  #   else
  #     redirect_to admin_mentors_path, :alert => "Unable to update user."
  #   end
  # end

  def destroy
    @mentor = Mentor.find(params[:id])
    @mentor.destroy
    redirect_to admin_mentors_path, notice: "User deleted."
  end

  private

  def mentor_params
    params.require(:mentor).permit(:is_active, user_attributes: user_params)
  end
end
