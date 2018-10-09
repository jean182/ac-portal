# frozen_string_literal: true
class Milestone < ApplicationRecord
  validates :title, presence: true
  belongs_to :phase
end
