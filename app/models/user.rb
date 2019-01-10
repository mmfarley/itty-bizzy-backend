class User < ApplicationRecord

  has_secure_password
  has_one :business, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :bills, dependent: :destroy
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

end
