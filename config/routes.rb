Rails.application.routes.draw do
 
  # set the root of this application to pages/home view but will just display /home
  root 'pages#home'

  # set the route for the about page and will be at /about
  get 'about', to: 'pages#about'

  # gives us a new article path for POST, EDIT, a PATCH , DELETE, SHOW, INDEX 
  resources :articles

end
