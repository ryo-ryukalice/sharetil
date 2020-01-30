require 'rails_helper'

RSpec.describe 'Users#show', type: :system do
  before do
    User.create(
      name: 'Ogihara Ryo',
      nickname: 'ogihara-ryo',
      bio: 'ソフトウェアエンジニア'
    )
  end

  example 'ユーザーページを表示すること' do
    visit user_path('ogihara-ryo')
    expect(page).to have_content 'Ogihara Ryo'
    expect(page).to have_content 'ogihara-ryo'
    expect(page).to have_content 'ソフトウェアエンジニア'
  end
end
