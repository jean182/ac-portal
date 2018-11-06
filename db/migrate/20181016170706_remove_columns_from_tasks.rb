class RemoveColumnsFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :is_complete, :boolean
    remove_column :tasks, :is_approved, :boolean
    rename_column :phases, :learning_objetive, :learning_objective
  end
end
