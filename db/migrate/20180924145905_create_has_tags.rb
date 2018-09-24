class CreateHasTags < ActiveRecord::Migration[5.2]
  def change
    create_table :has_tags do |t|
      t.references :checklists, foreign_key: true
      t.references :tags, foreign_key: true
      t.references :companies, foreign_key: true

      t.timestamps
    end
  end
end
