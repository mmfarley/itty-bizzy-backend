class Appointment < ApplicationRecord

  belongs_to :appointment_user, foreign_key: :appointment_user_id, class_name: "User"
  belongs_to :business

end
