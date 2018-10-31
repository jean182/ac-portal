# == Schema Information
#
# Table name: companies
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  logo        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mentor_id   :bigint(8)
#  phone       :string
#

class Company < ApplicationRecord
  has_many :has_tags, dependent: :destroy
  has_many :tags, through: :has_tags
  has_many :client_infos
  has_many :clients, through: :client_infos, dependent: :destroy
  has_many :company_phases
  has_many :phases, through: :company_phases
  has_one :location, dependent: :destroy
  has_many :time_trackings
  has_many :company_tasks
  belongs_to :mentor, optional: true

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :company_phases, reject_if: :all_blank, allow_destroy: true

  after_save :update_company_phases

  attr_accessor :current_phase_id

  def current_phase
    company_phases.with_status(:active).first
  end

  private

  def update_company_phases
    return unless current_phase_id.present?
    current_phase = Phase.find_by(phase_number: current_phase_id)
    if company_phases.count > 0
      company_phases.each do |company_phase|
        if company_phase.phase_id == current_phase.id
          company_phase.update_attributes(status: 2)   # 2 = active
        elsif company_phase.phase.phase_number.value < current_phase_id.to_i
          company_phase.update_attributes(status: 3)   # 3 = completed
        else
          company_phase.update_attributes(status: 1)   # 2 = inactive
        end
      end
    else
      Phase.find_each do |phase|
        if phase.id == current_phase.id
          company_phases.create(phase: phase, status: 2)   # 2 = active
        elsif phase.phase_number.value < current_phase_id.to_i
          company_phases.create(phase: phase, status: 3)   # 3 = completed
        else
          company_phases.create(phase: phase, status: 1)   # 2 = inactive
        end
      end
    end
  end
end
