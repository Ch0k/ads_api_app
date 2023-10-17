Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'signup', to: "users#create"
  post 'signin', to: "sessions#create"

  resources :ads, only: %i[create]
end
