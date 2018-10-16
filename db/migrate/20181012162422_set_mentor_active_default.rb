class SetMentorActiveDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :mentor_infos, :is_active, :boolean, :default => true
  end
end
