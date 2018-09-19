class RemoveRoleAndChangeRoleable < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :users, :roleable_type, :account_type
    rename_column :users, :roleable_id, :account_id
    remove_column :users, :role
  end
end
