Rails.application.routes.draw do
  resources :users
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tickets#index'
end
