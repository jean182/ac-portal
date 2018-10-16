require 'rails_helper'

describe Client, type: :model do
  describe 'associations' do
    it { should have_many(:time_trackings) }
    it { should have_one(:client_info) }
  end

  describe 'triggers' do
    describe 'create_client_info' do
      let(:client) { FactoryBot.create :client }

      it 'creates a mentor_infor' do
        expect(client.client_info).to be_present
      end
    end
  end
end