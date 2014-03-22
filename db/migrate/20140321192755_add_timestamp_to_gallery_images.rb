class AddTimestampToGalleryImages < ActiveRecord::Migration
  def change
    add_column :gallery_images, :created_at, :datetime
    add_column :gallery_images, :updated_at, :datetime
  end
end
