class ProfilesController < ApplicationController
    def show
        @user = User.find(params[:id])
        # @user = current_user
    end
end