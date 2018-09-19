# frozen_string_literal: true
class AddChecklistsToTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :checklist, foreign_key: true, dependent: :destroy
  end
end
