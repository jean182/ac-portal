# == Schema Information
#
# Table name: companies
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  logo        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mentor_id   :bigint(8)
#  phone       :string
#

FactoryBot.define do
  factory :company do
    name { Faker::Name.unique.name }
    description { Faker::Pokemon.name }
    phone {Faker::PhoneNumber.phone_number}
  end
end
