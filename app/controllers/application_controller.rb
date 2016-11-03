class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def find_answer_by_question(question)
    @answers ||=question.answers
  end

  helper_method :find_answer_by_question
end
