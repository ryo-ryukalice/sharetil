require 'rails_helper'

RSpec.describe 'Users', type: :system do
  example '初回サインイン時に User が作られること' do
    expect(User.count).to eq 0
    sign_in
    expect(page).to have_text 'Sign out'
    expect(User.count).to eq 1
  end
end
