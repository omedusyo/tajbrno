class CreateDishesMenuCategoriesJoin < ActiveRecord::Migration
  def change
    create_table :dishes_menu_categories, id: false do |t|
      t.integer :dish_id
      t.integer :menu_category_id
    end
    add_index :dishes_menu_categories, [ :dish_id, :menu_category_id ]
  end
end
