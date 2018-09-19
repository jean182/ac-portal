class CreateTimeTrackings < ActiveRecord::Migration[5.2]
  def change
    create_table :time_trackings do |t|
      t.date :date
      t.decimal :hours_spent

      t.timestamps
    end
  end
end
