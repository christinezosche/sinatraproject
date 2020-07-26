class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :ship
      t.string :items
      t.string :destination
      t.string :date
      t.string :user_id
  end
end
