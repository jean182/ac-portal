require 'rails_helper'

describe User, type: :model do
  describe 'associations' do
    it { should belong_to(:account) }
  end
end
