class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  validates :user_id,presence: true
  validates :answer_id,presence: true
  validates :is_up,presence: true


  validates :answer_id,uniqueness: {scope: :user_id}



end
