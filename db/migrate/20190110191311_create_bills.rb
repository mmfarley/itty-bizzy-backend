class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.float :amount
      t.datetime :due_date
      t.integer :biz_user_id
      t.integer :client_user_id
      t.boolean :is_paid, default: false

      t.timestamps
    end
  end
end
