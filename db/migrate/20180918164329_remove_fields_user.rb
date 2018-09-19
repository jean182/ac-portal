class RemoveFieldsUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :client_company
  end
end
