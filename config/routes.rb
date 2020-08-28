Rails.application.routes.draw do
  resources :reviews
  resources :trails
  resources :hikers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
