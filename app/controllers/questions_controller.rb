class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def create
        question_params = params.require(:question).permit(:body, :listing_id, :user_id)
        @question = Question.create(question_params)
        if @question.errors.any?
            @listing = Listing.find(params["question"]["listing_id"])
            @answer = Answer.new
            render "listings/show"
        else
            redirect_to listing_path
        end
    end
end