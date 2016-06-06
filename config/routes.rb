Rails.application.routes.draw do
  root to: 'welcome#show'

  get '/thoughts', to: 'thoughts#index'

  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end
