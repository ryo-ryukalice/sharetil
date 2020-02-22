Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,
           Rails.application.credentials&.dig(:github_api, :client_id),
           Rails.application.credentials&.dig(:github_api, :client_secret)
end

if Rails.env.development?
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(
    :github,
    'uid' => '12345678',
    'extra' => {
      'raw_info' => {
        'name' => 'Test User',
        'login' => 'test-user',
        'avatar_url' => 'https://avatars2.githubusercontent.com/u/0?v=4',
        'bio' => 'bio'
      }
    }
  )
end
