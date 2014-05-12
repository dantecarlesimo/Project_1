MortgageApp::Application.routes.draw do

  get '/search' => 'scenarios#search'
  resources :users, :scenarios, :sessions

  root to: 'sessions#new'

  

  get '/signup', to: 'users#new' 
  delete '/signout', to: 'sessions#destroy'
  get'/signin', to: 'sessions#new'


end
