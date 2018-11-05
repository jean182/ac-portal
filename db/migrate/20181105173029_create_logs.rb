class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :description
      t.integer :loggable_id
      t.string  :loggable_type
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
    add_index :logs, [:loggable_type, :loggable_id]
  end
end
