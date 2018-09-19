require 'rails_helper'

describe Mentor, type: :model do
  describe 'associations' do
    it { should have_many(:time_trackings) }
    it { should have_many(:clients) }
  end
end
