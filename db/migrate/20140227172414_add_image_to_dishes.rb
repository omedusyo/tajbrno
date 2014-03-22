class AddImageToDishes < ActiveRecord::Migration
  def up
    remove_column :dishes, :image_id

    add_column :dishes, :image, :string
  end

  def down
    remove_column :dishes, :image

    add_column :dishes, :image_id, :string
    add_index :dishes, :image_id
  end
end
