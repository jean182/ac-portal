# == Schema Information
#
# Table name: phases
#
#  id           :bigint(8)        not null, primary key
#  phase_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :phase do
    phase_number { 1 }
  end
end
