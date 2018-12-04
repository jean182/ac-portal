require 'rails_helper'

describe Mentor::MilestonesController, type: :controller do
  login_mentor
  let!(:phase) { create :phase, phase_number: 1 }
  let(:company) { create :company, current_phase_id: 1 }
  let(:milestone) { create(:milestone, company_phase: company.current_phase, complete: true) }

  describe "PUT #approve" do
    it "sets the milestone as approved" do
      put :approve, params: { milestone_id: milestone.id }
      expect(milestone.reload.approved).to be_truthy
    end
  end

  describe "PUT #refuse" do
    before do
      put :refuse, params: { milestone_id: milestone.id }
    end

    it "sets the milestone as not approved" do
      expect(milestone.reload.approved).to be_falsey
    end

    it "sets the milestone as not complete" do
      expect(milestone.reload.complete).to be_falsey
    end
  end
end
