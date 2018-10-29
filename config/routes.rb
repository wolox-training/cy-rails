Rails.application.routes.draw do
  get 'users/index'
  get 'rent/index'
  root to: 'application#index'
  api_version(module: 'api/v1', path: { value: 'api/v1' }) do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :books, only: [:index, :show]
    resources :rents, only: [:index, :create]
    resources :users
  end
 end
