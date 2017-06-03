class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.text :title
      t.boolean :public

      t.timestamps
    end
  end
end
