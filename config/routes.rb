Rails.application.routes.draw do
  get '/', to: 'application#hello', as: 'root'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new', as: 'signup'

  resources :users, only: [:show]
  resources :events, only: [:create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
