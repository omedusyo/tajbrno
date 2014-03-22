class AddImageToGalleryImages < ActiveRecord::Migration
  def up
    remove_column :gallery_images, :image_id
    remove_column :gallery_images, :thumbnail_id

    add_column :gallery_images, :image, :string
  end

  def down
    remove_column :gallery_images, :image

    add_column :gallery_images, :thumbnail_id, :integer
    add_column :gallery_images, :image_id, :integer

    add_index :gallery_images, [ :image_id, :thumbnail_id ]
  end
end
