# frozen_string_literal: true
# == Schema Information
#
# Table name: phases
#
#  id           :bigint(8)        not null, primary key
#  phase_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Phase < ApplicationRecord
  include Enumerize

  has_many :checklists, dependent: :destroy
  has_many :company_phases
  has_many :companies, through: :company_phases

  enumerize :phase_number, in: {:first_phase => 1, :second_phase => 2, :third_phase => 3, :fourth_phase => 4}
end
