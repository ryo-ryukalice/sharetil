require 'rails_helper'

RSpec.describe 'Follows', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user1) { create(:user) }
  # let(:user2) { create(:user) }

  describe 'フォローボタンのテスト' do
    before do
      sign_in
      visit user_path(user1.nickname)
    end

    it 'フォロー出来ること' do
      expect { find('.btn-primary').click }.to change { user1.followers.count }.from(0).to(1)
    end

    it 'フォロー解除できること' do
      find('.btn-primary').click
      visit user_path(user1.nickname)
      expect { find('.btn-primary').click }.to change { user1.followers.count }.from(1).to(0)
    end
  end
end
