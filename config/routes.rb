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

  # Do I need to crate 2 routes for answer?
  post "/listings/:id/anser", to: "listings#answer", as: "answer_listing"

  # Routes - Pages
  get "/", to: "pages#home", as: "root"
end
