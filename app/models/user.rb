class User < ApplicationRecord
  before_validation :downcase_email


  has_secure_password

  has_many :answers, dependent: :nullify
  has_many :questions, dependent: :nullify

  validates :name,presence: true
  validates :email,uniqueness: true,presence: true

  private
  def downcase_email
    email.downcase! if email.present?
  end


end
