class ListingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :set_user_listing, only: [:edit, :update]

    def index
        @listings = Listing.all

        if params[:search] && !params[:search].empty?
          @listings = Listing.where(title: params[:search])
      else
        @listings = Listing.all
      end
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing = current_user.listings.create(listing_params)

        if @listing.errors.any?
          render "new"
      else 
          redirect_to listing_path(@listing)
      end
    end



    def show
      @suburb = @listing.location[:suburb]
      @postcode = @listing.location[:postcode]
      @state = @listing.location[:state]
    end

    def edit
    end


    def update
        respond_to do |format|
            if @listing.update(listing_params)
              format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
              format.json { render :show, status: :ok, location: @listing }
            else
              format.html { render :edit }
              format.json { render json: @listing.errors, status: :unprocessable_entity }
            end
          end
    end
    
    def destroy
        @listing.destroy
        respond_to do |format|
          format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    def answewr
         # do it later
    end

    private
 
    def listing_params
      params.require(:listing).permit(:title, :brand, :price, :description, :category, :user_id, :location_id, :pic)
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