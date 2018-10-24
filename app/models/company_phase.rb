# == Schema Information
#
# Table name: company_phases
#
#  id                  :bigint(8)        not null, primary key
#  learning_objectives :text
#  company_id          :bigint(8)
#  phase_id            :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  status              :integer
#

class CompanyPhase < ApplicationRecord
  extend Enumerize

  belongs_to :company
  belongs_to :phase
  has_many :milestones, dependent: :destroy, inverse_of: :company_phase

  enumerize :status, in: {:inactive => 1, :active => 2, :completed => 3}, scope: true

  accepts_nested_attributes_for :milestones, reject_if: :all_blank, allow_destroy: true

  delegate :phase_number, to: :phase

  def checklists
    checklist_arr = []
    phase.checklists.each do |checklist|
      company.tags.each do |company_tag|
        if checklist.tags.include?(company_tag)
          checklist_arr << checklist
        end
      end
    end
  end
end
