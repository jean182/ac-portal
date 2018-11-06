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

FactoryBot.define do
  factory :checklist do
    name { Faker::Name.unique.name }
    order { Faker::Number.number(2) }
  end
end
