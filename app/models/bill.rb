class Bill < ApplicationRecord

  belongs_to :biz_user, foreign_key: :biz_user_id, class_name: "User"
  belongs_to :client_user, foreign_key: :client_user_id, class_name: "User"

end
