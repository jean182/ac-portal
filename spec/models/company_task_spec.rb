# == Schema Information
#
# Table name: company_tasks
#
#  id         :bigint(8)        not null, primary key
#  approved   :boolean
#  complete   :boolean
#  company_id :bigint(8)
#  task_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CompanyTask, type: :model do
  describe 'associations' do
    it { should belong_to(:company) }
    it { should belong_to(:task) }
    it { should have_many(:messages) }
    it { should have_many(:logs) }
  end
end
