class AddStatusToCompanyPhase < ActiveRecord::Migration[5.2]
  def change
    add_column :company_phases, :status, :integer
  end
end
