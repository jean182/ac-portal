class AddPolymorphicAssociationUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :roleable_type, :string
    add_column :users, :roleable_id, :integer
  end
end
