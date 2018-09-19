# frozen_string_literal: true
class RefactorAdmin < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :description
    add_reference :locations, :admin, foreign_key: true, dependent: :destroy
  end
end
