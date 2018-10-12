Rails.application.routes.draw do
  devise_for :users
  # token auth routes available at /api/v1/auth
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      api_version(
        header: {
          name: 'Accept',
          value: 'application/vnd.versionist_api.v1+json'
        },
        module: 'V1',
        default: true,
        defaults: { format: :json }
      ) do
        resources :books, only: [:index, :show]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
