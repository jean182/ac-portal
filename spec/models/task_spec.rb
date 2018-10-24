# frozen_string_literal: true
# == Schema Information
#
# Table name: tasks
#
#  id           :bigint(8)        not null, primary key
#  description  :string
#  score        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint(8)
#

require 'rails_helper'

describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:checklist) }
  end

  describe 'methods' do
    describe 'completed_by_company?' do
      let(:company) { create :company }
      let(:checklist) { create :checklist }
      let(:task) { create :task, checklist: checklist }
      let(:company_task) { create :company_tasks, company: company, task: task }

      it 'should return true' do
        expect(task.company_tasks).to be_truthy
      end
      it 'should return false' do
        task.company_tasks.destroy
        expect(task.company_tasks).to be_empty
      end
    end
  end
end
