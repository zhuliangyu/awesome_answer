class LikesController < ApplicationController
  before_action :authentication_like

  def create
    @question=Question.find(params[:question_id])
    @user=current_user
    @like=Like.new
    @like.user=@user
    @like.question=@question
    @like.save
    redirect_to question_path(@question)

  end

  def destroy
    @question=Question.find(params[:id])
    @like=@question.likes.find_by(user: current_user)

    # if @like is not nil,destroy, otherwise go back
    if @like
      @like.destroy
      redirect_to question_path(@question)
    else
      redirect_to :back
    end



  end

  private
  def authentication_like
    redirect_to new_session_path, notice: "Please log in first!" unless user_sign_in?

  end

end
