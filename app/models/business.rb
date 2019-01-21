class Business < ApplicationRecord
  belongs_to :user
  has_many :clients
  has_many :client_users, through: :clients
end
