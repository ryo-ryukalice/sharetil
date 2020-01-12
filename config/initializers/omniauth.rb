Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,
           Rails.application.credentials.github_api[:client_id],
           Rails.application.credentials.github_api[:client_secret]
end
