class AddCompleteStatusToMilestone < ActiveRecord::Migration[5.2]
  def change
    add_column :milestones, :complete, :boolean
  end
end
