class ListingsController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_listing, only: [:show, :edit, :update, :destroy, :purchase]
    # before_action :set_user_listing, only: [:edit, :update]

    def index
      @listings = Listing.search(params[:search])
    end

    def new
        #@listing = Listing.new 
        @listing = current_user.listings.new 
        #[code when user logged in]
        @listing.build_location
    end

    def create
      #@listing = Listing.create(listing_params)
        @listing = current_user.listings.create(listing_params) 
           #[code when user logged in]
      if @listing.errors.any?
          render "new"
      else 
          redirect_to listing_path(@listing)
      end
    end

    def show
#show listing
      @listings = Listing.search(params[:search])
      @suburb = @listing.location[:suburb]
      @postcode = @listing.location[:postcode]
      @state = @listing.location[:state]

      @question = Question.new
      @answer = Answer.new

    end

    def purchase
      # Stripe
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @listing.title,
            amount: @listing.price * 100,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @listing.id
            }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
        cancel_url: "#{root_url}listings"
    )

    @session_id = session.id
    @public_key = Rails.application.credentials.dig(:stripe, :public_key) 
    end


    def edit
    end


    def update
          if @listing.update(listing_params)
            redirect_to listing_path(@listing)  
          else
            render "edit"
        end
    end
    
    def destroy
        @listing.destroy
        redirect_to(listings_path)
    end

    private
 
    def listing_params
      params.require(:listing).permit(:title, :brand, :price, :description, :category, :user_id, :pic, :search, location_attributes: [:suburb, :postcode, :state, :_destroy])
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_user_listing
        @listing = current_user.listings.find_by_id(params[:id])

        if @listing == nil
            redirect_to listings_path
        end
    end

end