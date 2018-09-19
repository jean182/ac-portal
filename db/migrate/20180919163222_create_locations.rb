# frozen_string_literal: true
class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
