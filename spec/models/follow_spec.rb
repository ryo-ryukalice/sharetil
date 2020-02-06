require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:follow) { Follow.create(follow) }
  let(:followee) { create(:user) }
  let(:follower) { create(:user) }

  example 'フォロイーとフォロワーの関連が設定されていること' do
    Follow.create!(followee: followee, follower: follower)
    expect(Follow.last).to have_attributes(followee_id: followee.id, follower_id: follower.id)
  end
end
