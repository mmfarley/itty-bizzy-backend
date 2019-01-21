class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.references :client_user
      t.references :business, foreign_key: true

      t.timestamps
    end
    add_foreign_key :clients, :users, column: :client_user_id
  end
end
