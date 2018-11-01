class AddApprovedToMilestones < ActiveRecord::Migration[5.2]
  def change
    add_column :milestones, :approved, :boolean
  end
end
