# == Schema Information
#
# Table name: milestones
#
#  id               :bigint(8)        not null, primary key
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  complete         :boolean          default(FALSE)
#  company_phase_id :bigint(8)
#  approved         :boolean          default(FALSE)
#

FactoryBot.define do
  factory :milestone do
    title { "title 1" }
    complete { false }
  end
end
