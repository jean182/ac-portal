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

FactoryBot.define do
  factory :company_task do
    approved { false }
    complete { false }
  end
end
