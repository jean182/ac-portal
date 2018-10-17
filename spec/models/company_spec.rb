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

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { should have_many(:phases) }
    it { should have_many(:tags).through(:has_tags) }
    it { should have_many(:clients).through(:client_infos) }
    it { should have_many(:time_trackings) }
    it { should have_one(:location) }
    it { should belong_to(:mentor) }
  end
end
