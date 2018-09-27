class AddMentorToHasTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :has_tags, :mentor, foreign_key: true
  end
end
