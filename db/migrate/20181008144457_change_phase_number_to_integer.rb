class ChangePhaseNumberToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :phases, :phase_number, :integer
  end
end
