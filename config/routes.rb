Rails.application.routes.draw do
  # Routes - Devise (automatically created)
  devise_for :users
 
  # Routes - Listings
  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  get "/listings/:id", to: "listings#show", as: "listing"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
  delete "/listings/:id", to: "listings#destroy"
  
  # Routes - Pages
  get "/", to: "pages#home", as: "root"

  # Routes - question (only 1 route for create, get/form will be shown on show_listing)
  # post "/listings/:listing_id/questions", to: "questions#create", as: "questions"

  # post "/listings/:id/question", to: "questions#create", as: "questions"

  post "/questions", to: "questions#create", as: "questions"

  # Routes - answer (only 1 route for create, get/form will be shown on show_listing)
  post "/questions/:id/answer", to: "answers#create", as: "answers"


end
