class ChangeTimeTracking < ActiveRecord::Migration[5.2]
  def change
    remove_column :time_trackings, :client_id, :integer
    add_column :time_trackings, :notes, :text
  end
end
