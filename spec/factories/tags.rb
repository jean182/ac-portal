# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_type   :integer
#

FactoryBot.define do
  factory :tag do
    name { Faker::Pokemon.name }
    tag_type 1
  end
end
