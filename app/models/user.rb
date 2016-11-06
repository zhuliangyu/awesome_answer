class User < ApplicationRecord
  before_validation :downcase_email


  has_secure_password

  has_many :answers, dependent: :nullify
  has_many :questions, dependent: :nullify
  has_many :questions,through: :likes
  has_many :likes,dependent: :destroy

  validates :name,presence: true
  validates :email,uniqueness: true,presence: true

  has_many :votes,dependent: :destroy
  has_many :answers,through: :votes

  private
  def downcase_email
    email.downcase! if email.present?
  end


end
