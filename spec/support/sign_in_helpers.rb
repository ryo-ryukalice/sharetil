module SignInHelpers
  module System
    def sign_in
      visit root_path
      click_link 'Sign in with GitHub'
    end
  end
end

RSpec.configure do |config|
  config.include SignInHelpers::System, type: :system
end
