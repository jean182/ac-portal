# frozen_string_literal: true
class Phase < ApplicationRecord
  has_many :checklists, dependent: :destroy
  has_many :milestones, dependent: :destroy, inverse_of: :phase
  belongs_to :company
  enum phase_number: [:first_phase, :second_phase, :third_phase, :fourth_phase]
  enum status: [:inactive, :active, :completed]
  accepts_nested_attributes_for :milestones, reject_if: :all_blank, allow_destroy: true
end
