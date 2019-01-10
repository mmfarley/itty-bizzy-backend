class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :sender_user_id
      t.integer :receiver_user_id

      t.timestamps
    end
  end
end
