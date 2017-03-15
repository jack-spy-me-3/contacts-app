Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "contacts#index"
  get "/contacts", to: "contacts#index"
  get "/contacts/new", to: "contacts#new"
  post "/contacts", to: "contacts#create"
  get "/contacts/:id", to: "contacts#show"
  get "/contacts/:id/edit", to: "contacts#edit"
  patch "/contacts/:id", to: "contacts#update"
  delete "/contacts/:id", to: 'contacts#destroy'

  get "/all_johns", to: 'contacts#all_johns'

  # sign up
  get "/sign_up", to: 'users#new'
  post "/users", to: 'users#create'

  get '/login', to: 'sessions#new'
  post "/login", to: "sessions#create"
  get '/logout', to: "sessions#destroy"
end
