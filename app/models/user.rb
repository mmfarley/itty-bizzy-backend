class User < ApplicationRecord

  has_secure_password

  has_one :business, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  has_many :bills, dependent: :destroy
  has_many :received_bills, foreign_key: :billed_user_id, class_name: "Bill", dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :received_messages, foreign_key: :messaged_user_id, class_name: "Message", dependent: :destroy

end
