class CreateCompanyTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :company_tasks do |t|
      t.boolean :is_approved
      t.boolean :is_complete
      t.belongs_to :company, index: true
      t.belongs_to :task, index: true

      t.timestamps
    end
  end
end
