Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create]

  #get '/signup', to: "users#new"
  #post '/users', to: "users##create"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/welcome', to: "users#welcome"
  get '/logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
