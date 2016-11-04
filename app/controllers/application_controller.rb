class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def find_answer_by_question(question)
    @answers ||=question.answers
  end

  helper_method :find_answer_by_question


  def current_user

    if user_sign_in?
      @user ||=User.find(session[:user_id])
    end

  end
  helper_method :current_user

  def user_sign_in?
    session[:user_id].present?
  end
  helper_method :user_sign_in?



end
