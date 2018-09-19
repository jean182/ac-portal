# frozen_string_literal: true
class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :text
      t.date :date

      t.timestamps
    end
  end
end
