# frozen_string_literal: true
class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :is_complete
      t.decimal :score
      t.boolean :is_approved

      t.timestamps
    end
  end
end
