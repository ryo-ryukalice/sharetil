Rails.application.routes.draw do
  root 'home#index'

  get '/auth/github/callback' => 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  resources :users, path: '/', only: :show, param: :nickname do
    resources :followees, only: :index
    resources :followers, only: :index
  end
end
