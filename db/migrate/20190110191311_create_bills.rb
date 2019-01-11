class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :recipient
      t.float :amount
      t.datetime :due_date
      t.references :user, foreign_key: true
      t.references :billed_user
      t.boolean :is_paid, :default => false

      t.timestamps
    end

    add_foreign_key :bills, :users, column: :billed_user_id
  end
end
