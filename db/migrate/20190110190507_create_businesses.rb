class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.float :hourly_rate
      t.string :service_type
      t.string :name

      t.timestamps
    end
  end
end
