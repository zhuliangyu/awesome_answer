class AnswersController < ApplicationController

  def create
    @answer=Answer.new(get_answer_params)
    @answer.question=get_question
    if @answer.save
      redirect_to question_path(get_question)

    else

      redirect_to question_path(get_question), alert: error_message


    end


  end

  def destroy
    @answer=get_answer
    @answer.destroy
    @question=get_question_by_answer(@answer)
   redirect_to question_path(@question)




  end

  private

  def get_answer_params
    params.require(:answer).permit([:body])

  end

  def get_question
    Question.find(params[:question_id])
  end

  def error_message
    @answer.errors.full_messages.to_sentence
  end

  def get_answer
    Answer.find(params[:id])
  end

  def get_question_by_answer(answer)
    answer.question
  end
end
