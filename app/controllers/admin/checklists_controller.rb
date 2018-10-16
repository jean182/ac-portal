class Admin::ChecklistsController < Admin::AdminBaseController
  before_action :set_checklist, except: [:index, :new, :create]

  def index
    @checklists = Checklist.all
  end

  def show
    @tasks = @checklist.tasks
    @color = %w(primary success info light dark)
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(checklist_params)
    if @checklist.save
      redirect_to(admin_checklists_path, notice: 'Checklist was successfully created.')
    else
      render action: :new
    end
  end

  def edit
    build_has_tags
  end

  def update
    if @checklist.update(checklist_params)
      redirect_to(admin_checklists_path, notice: 'Checklist was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    raise "Cannot delete checklist with companies" if @checklist.phase.present?
    if @checklist.destroy
      flash[:success] = "Deleted succesfully."
      redirect_to admin_tags_path
    else
      flash[:error] = "Could not process your request"
    end
  end

  private

  def set_checklist
    @checklist ||= Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:name, :order,
                                      tasks_attributes: [:id, :description, :is_complete, :score, :_destroy],
                                      tag_ids: [])
  end

  def build_has_tags
    Tag.all.each do |tag|
      @checklist.has_tags.build(tag_id: tag.id)
    end
  end
end
