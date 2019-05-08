Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
registrations: 'users/registrations'}

  root to: 'main#index'
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
