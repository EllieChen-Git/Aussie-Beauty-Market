class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]

    def index
        @listings = Listing.all
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.new(listing_params)

        respond_to do |format|
          if @listing.save
            format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
            format.json { render :show, status: :created, location: @listing }
          else
            format.html { render :new }
            format.json { render json: @listing.errors, status: :unprocessable_entity }
          end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :brand, :price, :description, :category, :user_id, :location_id, :pic)
    end
end