# == Schema Information
#
# Table name: company_phases
#
#  id                 :bigint(8)        not null, primary key
#  learning_objective :text
#  company_id         :bigint(8)
#  phase_id           :bigint(8)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class CompanyPhase < ApplicationRecord
  belongs_to :company
  belongs_to :phase
end
