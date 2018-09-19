# frozen_string_literal: true
class Checklist < ApplicationRecord
  has_many :tasks, dependent: :destroy

  has_many :tags, dependent: :destroy

  belongs_to :phase
end
