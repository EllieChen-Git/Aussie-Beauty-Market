Rails.application.routes.draw do
  # Routes - Devise (automatically created)
  devise_for :users  
  #   new_user_session GET         /users/sign_in(.:format)        devise/sessions#new
  #   user_session POST            /users/sign_in(.:format)        devise/sessions#create
  # destroy_user_session DELETE    /users/sign_out(.:format)        devise/sessions#destroy
  # new_user_password GET          /users/password/new(.:format)     devise/passwords#new
  # edit_user_password GET         /users/password/edit(.:format)   devise/passwords#edit
  #  user_password PATCH           /users/password(.:format)        devise/passwords#update
  #                PUT             /users/password(.:format)        devise/passwords#update
  #                POST            /users/password(.:format)        devise/passwords#create
  # cancel_user_registration GET   /users/cancel(.:format)         devise/registrations#cancel
  # new_user_registration GET      /users/sign_up(.:format)        devise/registrations#new
  # edit_user_registration GET     /users/edit(.:format)           devise/registrations#edit
  # user_registration PATCH        /users(.:format)                devise/registrations#update
  #                PUT             /users(.:format)                devise/registrations#update
  #                DELETE          /users(.:format)                devise/registrations#destroy
  #                POST            /users(.:format)                devise/registrations#create
  
  # Routes - Listings
  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  get "/listings/:id", to: "listings#show", as: "listing"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
  delete "/listings/:id", to: "listings#destroy"
  
  # Routes - Landing Page
  get "/", to: "pages#home", as: "root"

  # Routes - Question (Only need create route, as get/form will be shown on show_listing)
  post "/listings/:id/questions", to: "questions#create", as: "questions"

  # Routes - Answer (Only need create route, as get/form will be shown on show_listing)
  post "/questions/:id/answers", to: "answers#create", as: "answers"

  # Routes - Profile (:id here is the id column in User table)
  get "/profiles/:id", to: "profiles#show", as: "profile"

  # Routes - Advanced Searches
  post "/searches", to: "searches#create", as: "searches"
  get "/searches/new", to: "searches#new", as: "new_search"
  get "/searches/:id", to: "searches#show", as: "search"
end
