Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
registrations: 'users/registrations'}

  root to: 'main#index'
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    resources :customers
    resource :login, only: [:create], controller: :sessions
    get "current_user" => "sessions#current_user_data"
  end
end
