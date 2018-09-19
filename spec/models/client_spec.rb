require 'rails_helper'

describe Client, type: :model do
  describe 'associations' do
    it { should have_many(:phases) }
    it { should have_many(:tags) }
    it { should have_many(:time_trackings) }

  end
end
