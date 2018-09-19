# frozen_string_literal: true
class CreateMilestones < ActiveRecord::Migration[5.2]
  def change
    create_table :milestones do |t|
      t.string :title

      t.timestamps
    end
  end
end
