class GalleryImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  mount_uploader :image, GalleryImageUploader
end
