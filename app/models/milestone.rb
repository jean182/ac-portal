# frozen_string_literal: true

# == Schema Information
#
# Table name: milestones
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  phase_id   :bigint(8)
#  complete   :boolean
#

class Milestone < ApplicationRecord
  belongs_to :phase

  validates :title, presence: true
end
