# frozen_string_literal: true

# == Schema Information
#
# Table name: checklists
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  order      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  phase_id   :bigint(8)
#

class Checklist < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :has_tags, dependent: :destroy
  has_many :tags, through: :has_tags

  belongs_to :phase, optional: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
  delegate :phase_number, to: :phase

  def mentors
    mentors = []
    Mentor.find_each do |mentor|
      mentors << mentor if (tags & mentor.tags).count > 0
    end
    mentors
  end
end
