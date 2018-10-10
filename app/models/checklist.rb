# frozen_string_literal: true
class Checklist < ApplicationRecord
  has_many :tasks, dependent: :destroy

  has_many :has_tags, dependent: :destroy
  has_many :tags, through: :has_tags

  belongs_to :phase, optional: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end
