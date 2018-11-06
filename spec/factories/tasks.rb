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

FactoryBot.define do
  factory :task do
    description { "sdfdsf" }
    score { 5 }
  end
end
