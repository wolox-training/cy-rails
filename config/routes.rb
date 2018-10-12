Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  api_version(:module => "api/v1", :path => {:value => "api/v1"}) do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :books, only: [:index, :show]
  end
end
