# frozen_string_literal: true
class AddChecklistsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :checklist, foreign_key: true, dependent: :destroy
  end
end
