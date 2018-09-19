# frozen_string_literal: true
class AddPhasesToChecklists < ActiveRecord::Migration[5.2]
  def change
    add_reference :checklists, :phase, foreign_key: true, dependent: :destroy
  end
end
