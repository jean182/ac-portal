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
  before_destroy :destroyable?
  has_many :tasks, dependent: :destroy
  has_many :has_tags, dependent: :destroy
  has_many :tags, through: :has_tags

  belongs_to :phase, optional: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  def destroyable?
    raise "Error" if phase.companies.count > 0
  end
end
