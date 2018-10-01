class AddColumnStatusToPhase < ActiveRecord::Migration[5.2]
  def change
    add_column :phases, :status, :integer
  end
end
