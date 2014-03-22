class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :alt
      t.integer :user_id
      t.integer :image_id
      t.integer :thumbnail_id
    end
    add_index :gallery_images, [ :user_id, :image_id, :thumbnail_id ]
  end
end
