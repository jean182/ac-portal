require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'associations' do
    it { should have_one(:user) }
  end
end
