class Admin::TagsController < Admin::AdminBaseController
  before_action :set_tag, except: [:index, :new, :create]
  def index
    @tags = Tag.all
  end

  def show; end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tag_path(@tag)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tag_path(@tag)
    else
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      flash[:success] = "Deleted succesfully."
      redirect_to admin_tags_path
    else
      flash[:error] = "Could not process your request"
    end
  end

  private

  def set_tag
    @tag ||= Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag)
          .permit(:name, :tag_type, has_tags_attributes: [:id])
  end
end
