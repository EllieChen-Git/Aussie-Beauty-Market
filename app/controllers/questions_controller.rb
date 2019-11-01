class QuestionsController < ApplicationController
    def create
        question_params = params.require(:question).permit(:body, :listing_id, :user_id)
        @question = Question.create(question_params)
        if @question.errors.any?
            render plain: "#{@question.errors.messages}. Please go back!" 
        else
            redirect_to listing_path
        end
    end
end