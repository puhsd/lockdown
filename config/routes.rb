Rails.application.routes.draw do
  resources :locks
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'link/(:code)', to: 'locks#link', as: 'link'
  get 'welcome', to: 'sessions#new', as: 'welcome'
  # get 'auth/:provider/callback', to: 'sessions#create'
  get 'login', to: 'sessions#create',  as: :create_login
  get 'auth/failure', to: redirect('/')

  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root "sessions#redirecting"

end
