require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { should have_many(:phases) }
    it { should have_many(:tags).through(:has_tags) }
    it { should have_many(:time_trackings) }
  end
end
