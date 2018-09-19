# frozen_string_literal: true
class CreatePhases < ActiveRecord::Migration[5.2]
  def change
    create_table :phases do |t|
      t.string :learning_objetive
      t.decimal :phase_number

      t.timestamps
    end
  end
end
