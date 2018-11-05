# == Schema Information
#
# Table name: logs
#
#  id            :bigint(8)        not null, primary key
#  description   :string
#  loggable_id   :integer
#  loggable_type :string
#  user_id       :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Log, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:loggable) }
  end
end
