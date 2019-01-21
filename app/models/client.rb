class Client < ApplicationRecord

  belongs_to :client_user, foreign_key: :client_user_id, class_name: "User"
  belongs_to :business

end
