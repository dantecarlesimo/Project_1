MortgageApp::Application.routes.draw do

  resources :users, :scenarios, :sessions

  root to: 'sessions#new'

  # get '/scenarios/new', to: 'scnearios#new', as: 'scenarios_new'
  # post '/scenarios', to: 'scenarios#create', as: 'scenarios'
  # get '/scenarios/:id', to: 'scenarios#show', as: 'scenario'

  get '/signup', to: 'users#new' 
  delete '/signout', to: 'sessions#destroy'
  get'/signin', to: 'sessions#new'
end
#    Prefix Verb   URI Pattern                   Controller#Action
#         users GET    /users(.:format)              users#index
#               POST   /users(.:format)              users#create
#      new_user GET    /users/new(.:format)          users#new
#     edit_user GET    /users/:id/edit(.:format)     users#edit
#          user GET    /users/:id(.:format)          users#show
#               PATCH  /users/:id(.:format)          users#update
#               PUT    /users/:id(.:format)          users#update
#               DELETE /users/:id(.:format)          users#destroy
#     scenarios GET    /scenarios(.:format)          scenarios#index
#               POST   /scenarios(.:format)          scenarios#create
#  new_scenario GET    /scenarios/new(.:format)      scenarios#new
# edit_scenario GET    /scenarios/:id/edit(.:format) scenarios#edit
#      scenario GET    /scenarios/:id(.:format)      scenarios#show
#               PATCH  /scenarios/:id(.:format)      scenarios#update
#               PUT    /scenarios/:id(.:format)      scenarios#update
#               DELETE /scenarios/:id(.:format)      scenarios#destroy
#      sessions GET    /sessions(.:format)           sessions#index
#               POST   /sessions(.:format)           sessions#create
#   new_session GET    /sessions/new(.:format)       sessions#new
#  edit_session GET    /sessions/:id/edit(.:format)  sessions#edit
#       session GET    /sessions/:id(.:format)       sessions#show
#               PATCH  /sessions/:id(.:format)       sessions#update
#               PUT    /sessions/:id(.:format)       sessions#update
#               DELETE /sessions/:id(.:format)       sessions#destroy
#          root GET    /                             users#new
#     users_new GET    /signup(.:format)             users#new
#       signout DELETE /signout(.:format)            sessions#destroy
#        signin GET    /signin(.:format)             sessions#new
