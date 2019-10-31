class AnswersController < ApplicationController
    def create
        answer_params = params.require(:answer).permit(:body, :question_id)
        @answer = Answer.create(answer_params)
        if @answer.errors.any?
            render plain: "not working"  
        else
            redirect_to listing_path
        end
    end
end