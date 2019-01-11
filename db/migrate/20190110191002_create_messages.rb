class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content, index: true
      t.references :user, index: true, foreign_key: true
      t.references :messaged_user, index: true
      
      t.timestamps
    end

    add_index :messages, [:user_id, :messaged_user_id, :content], unique: true
    add_foreign_key :messages, :users, column: :messaged_user_id
  end
end
