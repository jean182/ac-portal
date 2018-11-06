# frozen_string_literal: true
# == Schema Information
#
# Table name: milestones
#
#  id               :bigint(8)        not null, primary key
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  complete         :boolean          default(FALSE)
#  company_phase_id :bigint(8)
#  approved         :boolean
#

class Milestone < ApplicationRecord
  has_many :logs, as: :loggable
  belongs_to :company_phase

  default_scope { order(created_at: :asc) }

  validates :title, presence: true
end
