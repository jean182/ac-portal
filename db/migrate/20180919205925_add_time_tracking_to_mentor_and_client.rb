class AddTimeTrackingToMentorAndClient < ActiveRecord::Migration[5.2]
  def change
    add_reference :time_trackings, :mentor, foreign_key: true, dependent: :destroy
    add_reference :time_trackings, :client, foreign_key: true, dependent: :destroy
  end
end
