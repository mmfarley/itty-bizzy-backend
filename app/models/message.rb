class Message < ApplicationRecord

  belongs_to :sender_user, foreign_key: :sender_user_id, class_name: "User"
  belongs_to :receiver_user, foreign_key: :receiver_user_id, class_name: "User"

end
