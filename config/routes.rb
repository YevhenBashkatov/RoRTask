Rails.application.routes.draw do
  resources :trains do
    resources :tickets
    resources :railway_carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_arrive_time, on: :member
    patch :update_departure_time, on: :member
  end
  resources :routes
  resources :railway_carriages
  resources :welcomes

  resources :tickets

  resources :customers

  resource :search, only: %i[show new edit] do
    post '/', to: 'searches#search'
  end

  # get 'welcomes/index'
  # root 'welcomes#index'
  root 'searches#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
