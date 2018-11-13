Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'application#index'
  api_version(module: 'api/v1', path: { value: 'api/v1' }) do
    resources :books, only: [:index, :show, :book_info_external] do
      collection do
        get :book_info_external
      end
    end
    resources :rents, only: [:index, :create]
    resources :users, only: [:index]
    resources :book_suggestion, only: [:create]
  end
  mount_devise_token_auth_for 'User', at: 'auth'
 end
