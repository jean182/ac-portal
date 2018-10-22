class AddCompanyTaskToMessages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :messages, :task
    add_reference :messages, :company_task, foreign_key: true, dependent: :destroy
  end
end
