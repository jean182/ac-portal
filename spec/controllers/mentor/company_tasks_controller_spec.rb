require 'rails_helper'

describe Mentor::CompanyTasksController, type: :controller do
  login_mentor
  let!(:phase) { create :phase, phase_number: 1 }
  let!(:company) { create :company, current_phase_id: 1 }
  let!(:checklist) { create :checklist, phase_id: phase.id }
  let!(:task) { create :task, checklist_id: checklist.id }
  let!(:company_task) { create(:company_task, task_id: task.id, company_id: company.id, complete: true) }

  describe "PUT #approve" do
    it "sets the company task as approved" do
      put :approve, params: { company_task_id: task.id, company_id: company.id }
      expect(company_task.reload.approved).to be_truthy
    end
  end

  describe "PUT #refuse" do
    before do
      put :refuse, params: { company_task_id: task.id, company_id: company.id }
    end

    it "sets the milestone as not approved" do
      expect(company_task.reload.approved).to be_falsey
    end

    it "sets the milestone as not complete" do
      expect(company_task.reload.complete).to be_falsey
    end
  end
end
