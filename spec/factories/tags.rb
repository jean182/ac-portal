FactoryBot.define do
  factory :tag do
    name { Faker::Pokemon.name }
    tag_type 1
  end
end