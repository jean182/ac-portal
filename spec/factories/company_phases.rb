FactoryBot.define do
  factory :company_phase do
    learning_objective { Faker::Lorem.sentence(3) }
  end
end
