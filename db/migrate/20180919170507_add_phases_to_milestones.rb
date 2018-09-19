# frozen_string_literal: true
class AddPhasesToMilestones < ActiveRecord::Migration[5.2]
  def change
    add_reference :milestones, :phase, foreign_key: true, dependent: :destroy
  end
end
