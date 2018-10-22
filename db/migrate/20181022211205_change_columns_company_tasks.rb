class ChangeColumnsCompanyTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :company_tasks, :is_complete, :complete
    rename_column :company_tasks, :is_approved, :approved
  end
end
