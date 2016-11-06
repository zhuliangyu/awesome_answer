class Question < ApplicationRecord

  validates :title,presence: true
  validates :body,presence: true

  has_many :answers,dependent: :destroy

  belongs_to :user

  has_many :users,through: :likes
  has_many :likes,dependent: :destroy

end
