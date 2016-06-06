Rails.application.routes.draw do
  root to: 'links#index'

  get '/thoughts', to: 'thoughts#index'

  get '/welcome', to: 'welcome#show'

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create, :update, :edit]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
