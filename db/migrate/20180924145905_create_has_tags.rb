class CreateHasTags < ActiveRecord::Migration[5.2]
  def change
    create_table :has_tags do |t|
      t.references :checklist, foreign_key: true
      t.references :tag, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
