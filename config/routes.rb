Rails.application.routes.draw do
  root 'statique#accueil'
  get 'sessions/new'
  get 'session/new'
  get '/contact', to: 'statique#contact'
  get '/team', to: 'statique#team'
  get '/services', to: 'statique#services'
  get '/signup', to: 'utilisateurs#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :utilisateurs do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
