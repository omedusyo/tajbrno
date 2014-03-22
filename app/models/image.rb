class Image < ActiveRecord::Base
  has_many :gallery_images
  has_many :dishes
end
