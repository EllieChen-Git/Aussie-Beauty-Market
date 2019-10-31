class QuestionsController < ApplicationController
    def create
        question_params = params.require(:question).permit(:body, :listing_id, :user_id)
        @question = Question.create(question_params)
        if @question.errors.any?
            # render "new"
            render plain: "not working"
        else
            # redirect_to toys_path
            render plain: "working"
        end
    end
end