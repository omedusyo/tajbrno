class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end
    add_index :dishes, [ :user_id, :image_id ]
  end
end
