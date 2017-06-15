class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :articles
      t.references :users
      t.timestamps
    end
  end
end
