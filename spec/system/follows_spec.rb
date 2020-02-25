require 'rails_helper'

RSpec.describe 'Follows', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }

  describe 'フォローボタンのテスト(ユーザーページ)' do
    before do
      sign_in
      visit user_path(user.nickname)
    end

    example 'フォロー出来ること' do
      expect { click_on 'フォローする' }.to change { user.followers.count }.by(1)
    end

    example 'フォロー解除できること' do
      click_on 'フォローする'
      expect { click_on 'フォロー解除' }.to change { user.followers.count }.by(-1)
    end
  end

  describe 'フォローボタンのテスト(一覧ページ)' do
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }

    before do
      user2.follow(user)
      user3.follow(user)
      sign_in
      visit user_followers_path(user.nickname)
    end

    example 'フォロー出来ること' do
      within(".follow_form_#{user2.id}") { expect { click_on 'フォローする' }.to change { user2.followers.count }.by(1) }
    end

    example 'フォロー解除出来ること' do
      within(".follow_form_#{user2.id}") do
        click_on 'フォローする'
        expect { click_on 'フォロー解除' }.to change { user2.followers.count }.by(-1)
      end
    end

    example '特定のフォローボタンのみ切り替わっていること' do
      within(".follow_form_#{user2.id}") { click_on 'フォローする' }
      within(".follow_form_#{user3.id}") { expect(page).to have_button 'フォローする' }
    end
  end
end
