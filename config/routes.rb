Rails.application.routes.draw do
  get '/', to: 'application#hello', as: 'root'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new', as: 'signup'
  get '/users/:id', to: 'users#show'

  get '/events', to: 'events#index'
  post '/events', to: 'events#search'

  get '/events/:id', to: 'events#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
