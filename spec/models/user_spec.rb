require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'フォロイー/フォロワーの関連設定' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    example 'フォロイーを追加できること' do
      user1.followees << user2
      expect(user2.followers).to include user1
    end

    example 'フォロワーを追加できること' do
      user1.followers << user2
      expect(user2.followees).to include user1
    end
  end
end
