Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,
           Rails.application.credentials&.dig(:github_api, :client_id),
           Rails.application.credentials&.dig(:github_api, :client_secret)
end
