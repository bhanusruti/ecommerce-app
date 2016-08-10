Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'products#index'
  get '/products', to:'products#index'

  get '/products/new', to: 'products#new' 
  get '/products/:id', to: 'products#show'

  # we r makinng a new product
  post '/products', to: 'products#create'

  get '/products/:id/edit', to: 'products#edit'
  put '/products/:id', to: 'products#update'

  delete 'products/:id',to: 'products#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/orders', to: 'orders#create'
  get '/orders/:id', to: 'orders#show'
  patch '/orders/:id', to: 'orders#update'

  get '/carted_products', to: 'carted_products#index'
  post '/carted_products', to: 'carted_products#create'
  delete '/carted_products/:id', to: 'carted_products#destroy'
end
