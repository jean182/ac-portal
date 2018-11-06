# == Schema Information
#
# Table name: mentor_infos
#
#  id         :bigint(8)        not null, primary key
#  is_active  :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mentor_id  :integer
#

class MentorInfo < ApplicationRecord
  belongs_to :mentor, dependent: :destroy
end
