# == Schema Information
#
# Table name: time_trackings
#
#  id          :bigint(8)        not null, primary key
#  date        :date
#  hours_spent :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mentor_id   :bigint(8)
#  client_id   :bigint(8)
#  company_id  :bigint(8)
#

class TimeTracking < ApplicationRecord
  belongs_to :mentor
  belongs_to :company
end
