Rails.application.routes.draw do
  root to: 'application#index'
  api_version(module: 'api/v1', path: { value: 'api/v1' }) do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :books, only: [:index, :show]
    resources :rents, only: [:index, :create]
    resources :users, only: [:index]
  end
 end
