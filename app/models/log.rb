# == Schema Information
#
# Table name: logs
#
#  id            :bigint(8)        not null, primary key
#  description   :string
#  loggable_id   :integer
#  loggable_type :string
#  user_id       :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Log < ApplicationRecord
  belongs_to :user
  belongs_to :loggable, polymorphic: true
end
