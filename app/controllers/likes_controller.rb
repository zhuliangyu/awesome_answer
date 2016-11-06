class LikesController < ApplicationController
  before_action :authentication_like
  before_action :authorization_like

  def create
    @question=find_question
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

  def authorization_like
    redirect_to question_path(find_question), notice: "You can't like yourself!" unless can? :like, find_question

  end

  def find_question
    if params[:question_id]
      # from create url
      @question ||=Question.find(params[:question_id])

    elsif params[:id]
      # from destroy url
      @question ||= Question.find(params[:id])

    end
  end

end
