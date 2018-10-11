class RenameMentorIdColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :mentor_infos, :client_id, :mentor_id
  end
end
