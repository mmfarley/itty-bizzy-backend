class Business < ApplicationRecord
  belongs_to :user
  
  has_many :clients, dependent: :destroy
  has_many :client_users, through: :clients

  has_many :appointments, dependent: :destroy
  has_many :appointment_users, through: :appointments
end
