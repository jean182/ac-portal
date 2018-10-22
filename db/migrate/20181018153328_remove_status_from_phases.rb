class RemoveStatusFromPhases < ActiveRecord::Migration[5.2]
  def change
    remove_column :phases, :status, :integer
    add_column :company_phases, :status, :integer
  end
end
