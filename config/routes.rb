Rails.application.routes.draw do
  # Routes - automatically created by Devise
  devise_for :users
 
  # Routes - Listings
  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
  get "/listings/:id", to: "listings#show", as: "listing"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy"
  
  # Routes - Pages
  get "/", to: "pages#home", as: "root"
  get "*path", to: "pages#not_found"     
end
