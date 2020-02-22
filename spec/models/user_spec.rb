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

    describe 'model内のフォロー関連メソッド' do
      subject { user1.following?(user2) }

      describe 'following?が機能していること' do
        example 'trueを返す' do
          user1.followees << user2
          is_expected.to eq true
        end

        example 'falseを返す' do
          is_expected.to eq false
        end
      end

      example 'followが機能していること' do
        user1.follow(user2)
        is_expected.to eq true
      end

      example 'unfollowが機能していること' do
        user1.follow(user2)
        user1.unfollow(user2)
        is_expected.to eq false
      end
    end
  end
end
