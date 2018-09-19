# frozen_string_literal: true
class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.string :name
      t.decimal :order

      t.timestamps
    end
  end
end
