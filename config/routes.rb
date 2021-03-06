Rails.application.routes.draw do
  resources :bookings
  devise_for :users
  resources :tickets, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tickets#index'

  resources :tickets do
    resources :bookings
  end
end
