class Like < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, presence: true

  validates :question_id, presence: :true


#   only can like one time
  validates :question_id,uniqueness: {scope: :user_id}

  private
  def self.like_count(question)
    question.likes.count


  end

end
