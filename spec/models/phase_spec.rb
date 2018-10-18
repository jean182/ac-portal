# frozen_string_literal: true
# == Schema Information
#
# Table name: phases
#
#  id                 :bigint(8)        not null, primary key
#  learning_objective :string
#  phase_number       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  status             :integer
#

require 'rails_helper'

describe Phase, type: :model do
  describe 'associations' do
    it { should have_many(:checklists) }
    it { should have_many(:milestones) }
    it { should have_many(:companies).through(:company_phases) }
  end
end
