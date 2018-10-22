require 'rails_helper'

describe Member::MilestonesController, type: :controller do
  login_client
  let(:company_phase) { create :company_phase, company_id: subject.current_user.client_info.company.id, phase: create(:phase) }

  describe "PUT #mark_complete" do
    let(:milestone) { create :milestone, complete: false, company_phase: company_phase }
    it "mark as complete the company_task" do
      put :mark_complete, params: { milestone_id: milestone.id.to_param }
      milestone.reload
      expect(milestone.attributes).to include("complete" => true)
    end
  end

  describe "PUT #mark_incomplete" do
    let(:milestone) { create :milestone, complete: true, company_phase: company_phase }
    it "mark as complete the company_task" do
      put :mark_incomplete, params: { milestone_id: milestone.id.to_param }
      milestone.reload
      expect(milestone.attributes).to include("complete" => false)
    end
  end
end
