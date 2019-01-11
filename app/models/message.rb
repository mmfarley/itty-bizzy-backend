class Message < ApplicationRecord

  belongs_to :user
  belongs_to :messaged_user, foreign_key: :messaged_user_id, class_name: "User"

end
