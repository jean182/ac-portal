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

require 'rails_helper'

RSpec.describe CompanyPhase, type: :model do
  describe 'associations' do
    it { should belong_to(:phase) }
    it { should belong_to(:company) }
    it { should have_many(:milestones) }
  end
end
