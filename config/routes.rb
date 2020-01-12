Rails.application.routes.draw do
  root 'home#index'

  get '/auth/github/callback' => 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
end
