# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  phone                  :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  deleted_at             :datetime
#  type                   :string
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_type        :string
#  invited_by_id          :bigint(8)
#  invitations_count      :integer          default(0)
#

require 'rails_helper'

describe User, type: :model do
  describe 'methods' do
    describe 'admin?' do
      context 'when is an admin' do
        let(:user) { FactoryBot.create :admin }

        it 'returns true' do
          expect(user.admin?).to be_truthy
        end
      end

      context 'when is not an admin' do
        let(:user) { FactoryBot.create :client }

        it 'returns false' do
          expect(user.admin?).to be_falsey
        end
      end
    end

    describe 'mentor?' do
      context 'when is a mentor' do
        let(:user) { FactoryBot.create :mentor }

        it 'returns true' do
          expect(user.mentor?).to be_truthy
        end
      end

      context 'when is not a mentor' do
        let(:user) { FactoryBot.create :client }

        it 'returns false' do
          expect(user.mentor?).to be_falsey
        end
      end
    end

    describe 'client??' do
      context 'when is a client' do
        let(:user) { FactoryBot.create :client }

        it 'returns true' do
          expect(user.client?).to be_truthy
        end
      end

      context 'when is not a client' do
        let(:user) { FactoryBot.create :mentor }

        it 'returns false' do
          expect(user.client?).to be_falsey
        end
      end
    end
  end
end
