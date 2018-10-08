# frozen_string_literal: true
class Phase < ApplicationRecord
  has_many :checklists, dependent: :destroy
  has_many :milestones, dependent: :destroy
  enum phase_number: [:first_phase, :second_phase, :third_phase, :fourth_phase]
  enum status: [:inactive, :active, :completed]
  belongs_to :company, dependent: :destroy
end
