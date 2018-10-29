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

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { should have_many(:phases) }
    it { should have_many(:tags).through(:has_tags) }
    it { should have_many(:clients).through(:client_infos) }
    it { should have_many(:time_trackings) }
    it { should have_one(:location) }
    it { should belong_to(:mentor) }
  end

  describe 'triggers' do
    describe 'update_company_phases' do
      let!(:first_phase) { create :phase, phase_number: 1 }
      let!(:second_phase) { create :phase, phase_number: 2 }
      let!(:third_phase) { create :phase, phase_number: 3 }
      let!(:fourth_phase) { create :phase, phase_number: 4 }
      let!(:company) { create :company, current_phase_id: 2 }

      it 'creates company_phases' do
        company.company_phases.each do |company_phase|
          if company_phase.phase_id == first_phase.id
            expect(company_phase.status).to eq(3)
          elsif company_phase.phase_id == second_phase.id
            expect(company_phase.status).to eq(2)
          elsif company_phase.phase_id == third_phase.id
            expect(company_phase.status).to eq(1)
          elsif company_phase.phase_id == fourth_phase.id
            expect(company_phase.status).to eq(1)
          end
        end
      end
    end
  end

  describe 'methods' do
    describe 'current_phase' do
      let(:company) { create :company }
      let(:phase) { create :phase }
      let!(:active_company_phase) { create :company_phase, company: company, phase: phase, status: 2 }
      let!(:inactive_company_phase) { create :company_phase, company: company, phase: phase, status: 2 }

      it 'returns the companies current phase' do
        expect(company.current_phase).to eq(active_company_phase)
      end
    end
  end
end
