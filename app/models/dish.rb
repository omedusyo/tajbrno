class Dish < ActiveRecord::Base
  has_and_belongs_to_many :menu_categories
  belongs_to :images
  belongs_to :user

  mount_uploader :image, DishImageUploader
end
