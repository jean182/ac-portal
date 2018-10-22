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
#

class Milestone < ApplicationRecord
  belongs_to :company_phase

  validates :title, presence: true
end
