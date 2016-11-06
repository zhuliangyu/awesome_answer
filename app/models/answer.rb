class Answer < ApplicationRecord
  belongs_to :question
  validates :question_id, presence: true
  validates :body, presence: true

  belongs_to :user

  has_many :votes,dependent: :destroy
  has_many :users,through: :votes






end
