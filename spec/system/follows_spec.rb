require 'rails_helper'

RSpec.describe 'Follows', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }

  describe 'フォローボタンのテスト' do
    before do
      sign_in
      visit user_path(user.nickname)
    end
    let(:follow_button_text) { 'フォローする' }
    let(:unfollow_button_text) { 'フォロー解除' }

    example 'フォロー出来ること' do
      expect { click_on follow_button_text }.to change { user.followers.count }.from(0).to(1)
    end

    example 'フォロー解除できること' do
      click_on follow_button_text
      expect { click_on unfollow_button_text }.to change { user.followers.count }.from(1).to(0)
    end
  end
end
