Rails.application.routes.draw do
 
  # set the root of this application to pages/home view but will just display /home
  root 'pages#home'

  # set the route for the about page and will be at /about
  get 'about', to: 'pages#about'

  # gives us a new article path for POST, EDIT, a PATCH , DELETE, SHOW, INDEX 
  resources :articles

  get 'signup', to: 'users#new'

  #provides all the routes except for the 'new' route which is handled by signup above ^^
  resources :users, except: [:new]
end
