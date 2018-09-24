class RemoveTagsReferencesFromCompanyAndChecklist < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :company_id
    remove_column :tags, :checklist_id
  end
end
