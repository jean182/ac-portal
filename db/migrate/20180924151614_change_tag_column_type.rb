class ChangeTagColumnType < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :type
    add_column :tags, :tag_type, :integer
  end
end
