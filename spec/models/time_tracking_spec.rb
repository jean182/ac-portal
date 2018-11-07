# == Schema Information
#
# Table name: time_trackings
#
#  id          :bigint(8)        not null, primary key
#  date        :date
#  hours_spent :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mentor_id   :bigint(8)
#  company_id  :bigint(8)
#  notes       :text
#

require 'rails_helper'

describe TimeTracking, type: :model do
  describe 'associations' do
    it { should belong_to(:company) }
    it { should belong_to(:mentor) }
  end

  describe 'triggers' do
    describe 'check_quota_exceeded' do
      let(:company) { create :company }
      let(:mentor) { create :mentor }
      let!(:admin) { create :admin }

      context 'when total time exceeds quota' do
        it 'sends email to admins' do
          expect { TimeTracking.create(company: company, mentor: mentor, hours_spent: 6, date: Date.today) }.to change { ActionMailer::Base.deliveries.count }.by(1)
        end
      end

      context 'when total time does not exceeds quota' do
        it 'does not send email to admins' do
          expect { TimeTracking.create(company: company, mentor: mentor, hours_spent: 2, date: Date.today) }.to change { ActionMailer::Base.deliveries.count }.by(0)
        end
      end
    end
  end
end
