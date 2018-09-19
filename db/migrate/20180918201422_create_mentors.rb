class CreateMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.boolean :is_active

      t.timestamps
    end
  end
end
