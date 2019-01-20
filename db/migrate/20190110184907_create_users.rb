class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.float :latitude, :default => 29.760427
      t.float :longitude, :default => -95.369804

      t.timestamps
    end
  end
end
