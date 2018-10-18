# == Schema Information
#
# Table name: phases
#
#  id                 :bigint(8)        not null, primary key
#  learning_objective :string
#  phase_number       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  status             :integer
#

FactoryBot.define do
  factory :phase do
    learning_objective { Faker::Lorem.sentence(3) }
  end
end
