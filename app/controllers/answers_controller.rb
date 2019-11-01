class AnswersController < ApplicationController
    def create
        answer_params = params.require(:answer).permit(:body, :question_id)
        @answer = Answer.create(answer_params)
        if @answer.errors.any?
            render plain: "#{@answer.errors.messages} Please go back!" 

            # @listing = Listing.find(params["answer"]["question_id"]["listing_id"])
            # @suburb = @listing.location[:suburb]
            # @postcode = @listing.location[:postcode]
            # @state = @listing.location[:state]
            # @question= Question.new
            # render "listings/show"
        else
            redirect_to listing_path
        end
    end
end