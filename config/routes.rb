Rails.application.routes.draw do
  get '/', to: 'welcome#home', as: 'root'
  post '/', to: 'sessions#new'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup', to: 'users#new', as: 'signup'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/users/:id', to: 'users#event', as: 'user_event'
  delete '/users/:id', to: 'users#delete_association'

  get '/events', to: 'events#index'
  post '/events', to: 'events#create'
  get '/events/search', to: 'events#search', as: 'search_results'
  get '/events/:id', to: 'events#show', as: 'event'

  post '/comments', to: 'comments#create'

  post '/likes', to: 'likes#create'

  get '/about', to: 'welcome#about', as: 'about'
  get '/contact', to: 'welcome#contact', as: 'contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
