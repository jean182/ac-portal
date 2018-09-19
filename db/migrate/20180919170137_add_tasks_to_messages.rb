# frozen_string_literal: true
class AddTasksToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :task, foreign_key: true, dependent: :destroy
  end
end
