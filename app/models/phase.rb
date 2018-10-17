# frozen_string_literal: true
# == Schema Information
#
# Table name: phases
#
#  id                 :bigint(8)        not null, primary key
#  learning_objective :string
#  phase_number       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :bigint(8)
#  status             :integer
#

class Phase < ApplicationRecord
  has_many :checklists, dependent: :destroy
  has_many :milestones, dependent: :destroy, inverse_of: :phase
  has_many :company_phases
  has_many :companies, through: :company_phases

  enum phase_number: [:first_phase, :second_phase, :third_phase, :fourth_phase]
  enum status: [:inactive, :active, :completed]

  accepts_nested_attributes_for :milestones, reject_if: :all_blank, allow_destroy: true
end
