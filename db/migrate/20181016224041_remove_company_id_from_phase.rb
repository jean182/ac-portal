class RemoveCompanyIdFromPhase < ActiveRecord::Migration[5.2]
  def change
    remove_column :phases, :company_id, :integer
  end
end
