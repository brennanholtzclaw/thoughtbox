Rails.application.routes.draw do
  get 'new/create'

  get 'new/destroy'

  root to: 'welcome#show'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end
