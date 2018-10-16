# == Schema Information
#
# Table name: client_infos
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint(8)
#  client_id   :integer
#

FactoryBot.define do
  factory :client_info do
    description { Faker::Pokemon.name }
  end
end
