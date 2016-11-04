class User < ApplicationRecord
  has_secure_password

  has_many :answers, dependent: :nullify
  has_many :questions, dependent: :nullify

  validates :name,presence: true
  validates :email,uniqueness: true,presence: true


end
