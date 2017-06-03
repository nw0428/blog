class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.text :name
      t.text :address
      t.text :genre
      t.text :phone_number

      t.timestamps
    end
  end
end
