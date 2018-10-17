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

require 'rails_helper'

describe Checklist, type: :model do
  describe 'associations' do
    it { should have_many(:tasks) }
    it { should have_many(:tags).through(:has_tags) }
    it { should belong_to(:phase) }
  end

  describe 'triggers' do
    describe 'saveable?' do
      let(:checklist) { FactoryBot.create(:checklist, :phase_checklist) }

      it 'returns true if phase is present and has companies' do
        company = create(:company)
        company2 = create(:company)
        phase = build(:phase, company_ids: [company.id, company2.id])

        checklist = create(:checklist, phase: phase)
        expect(checklist.phase.companies).to be_present
      end

      it 'returns false if phase is present and has no companies' do
        phase = create(:phase)

        checklist = create(:checklist, phase: phase)
        expect(checklist.phase.companies).not_to be_present
      end

      it 'returns false if phase is not present' do
        checklist = create(:checklist)
        expect(checklist.phase).not_to be_present
      end
    end
  end
end
