class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :appointment_user
      t.references :business, foreign_key: true
      t.string :date

      t.timestamps
    end
    add_foreign_key :appointments, :users, column: :appointment_user_id
  end
end
