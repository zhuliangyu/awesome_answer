class QuestionsController < ApplicationController

  def index
    @questions=Question.order(updated_at: :desc)
  end

  def new
    @question=Question.new


  end

  def create
    question_params=get_question_params()
    @question=Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      flash.now[:alert]=error_message()
      render :new

    end


  end

  def show
    @answer=Answer.new
    @question=find_question()



  end

  def edit
   @question=find_question



  end

  def update
    @question=Question.new(get_question_params)

    if @question.save
      redirect_to questions_path
    else
      flash.now[:alert]=error_message

      render :edit

    end



  end

  def destroy
    @question=find_question
    if @question
      @question.destroy
      redirect_to questions_path
    end


  end


  private
  def get_question_params
    params.require(:question).permit([:title, :body])
  end

  def error_message
    @question.errors.full_messages.to_sentence
  end

  def find_question
    Question.find(params[:id])
  end

end
