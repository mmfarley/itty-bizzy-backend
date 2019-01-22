class Business < ApplicationRecord
  belongs_to :user
  has_many :clients, dependent: :destroy
  has_many :client_users, through: :clients
end
