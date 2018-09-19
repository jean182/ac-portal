# frozen_string_literal: true
class Phase < ApplicationRecord

  has_many :checklists, dependent: :destroy
  has_many :milestones, dependent: :destroy

  belongs_to :client, dependent: :destroy
end
