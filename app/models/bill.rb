class Bill < ApplicationRecord

  belongs_to :user
  belongs_to :billed_user, foreign_key: :billed_user_id, class_name: "User"

end
