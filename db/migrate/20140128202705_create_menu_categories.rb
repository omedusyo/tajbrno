class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :menu_categories, :user_id
  end
end
