# == Schema Information
#
# Table name: company_phases
#
#  id                  :bigint(8)        not null, primary key
#  learning_objectives :text
#  company_id          :bigint(8)
#  phase_id            :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  status              :integer
#

FactoryBot.define do
  factory :company_phase do
    learning_objectives { Faker::Lorem.sentence(3) }
  end
end
