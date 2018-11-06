require 'rails_helper'

describe Member::TasksController, type: :controller do
  login_client
  let(:company) { subject.current_user.client_info.company }

  describe "PUT #mark_complete" do
    let(:company_task) { create :company_task, complete: false, company: company, task: create(:task, checklist: create(:checklist)) }
    it "mark as complete the company_task" do
      put :mark_complete, params: { task_id: company_task.task_id.to_param }
      company_task.reload
      expect(company_task.attributes).to include("complete" => true)
    end
  end

  describe "PUT #mark_incomplete" do
    let(:company_task) { create :company_task, complete: true, company: company, task: create(:task, checklist: create(:checklist)) }
    it "mark as complete the company_task" do
      put :mark_incomplete, params: { task_id: company_task.task_id.to_param }
      company_task.reload
      expect(company_task.attributes).to include("complete" => false)
    end
  end
end
