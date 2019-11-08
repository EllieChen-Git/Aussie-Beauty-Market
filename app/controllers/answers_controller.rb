class AnswersController < ApplicationController
    before_action :authenticate_user!
    def create
        answer_params = params.require(:answer).permit(:body, :question_id)
        @answer = Answer.create(answer_params)
        if @answer.errors.any?
            render plain: "Please make sure you enter the question id and fill out question!"
        else
            redirect_to listing_path
        end
    end
end