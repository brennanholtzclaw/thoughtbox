Rails.application.routes.draw do
  get '/welcome', to: 'welcome#show'
  root to: 'links#index'

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create, :update, :edit]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :links
    end
  end
end
