require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#pending?' do
    it 'returns users pending approval' do
      pending_user = FactoryBot.create(:user)
      expect(User.pending?).to include(pending_user)
    end
    it 'returns multiple users pending approval' do
      pending_user1 = FactoryBot.create(:user)
      pending_user2 = FactoryBot.create(:user)
      pending_user3 = FactoryBot.create(:user)
      expect(User.pending?).to include(pending_user1, pending_user2, pending_user3)
    end
    it 'does not return approved users' do
      approved_user = FactoryBot.create(:user, approve: true)
      expect(User.pending?).not_to include(approved_user)
    end
  end
  describe '#approved?' do
    it 'returns users pending approval' do
      pending_user = FactoryBot.create(:user)
      expect(User.approved?).to_not include(pending_user)
    end
    it 'returns approved users' do
      approved_user = FactoryBot.create(:user, approve: true)
      expect(User.approved?).to include(approved_user)
    end
    it 'returns multiple approved users' do
      approved_user1 = FactoryBot.create(:user, approve: true)
      approved_user2 = FactoryBot.create(:user, approve: true)
      approved_user3 = FactoryBot.create(:user, approve: true)
      expect(User.approved?).to include(approved_user1, approved_user2, approved_user3)
    end
  end
end