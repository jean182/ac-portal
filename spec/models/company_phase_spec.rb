require 'rails_helper'

RSpec.describe CompanyPhase, type: :model do
  describe 'associations' do
    it { should belong_to(:phase) }
    it { should belong_to(:company) }
  end
end
