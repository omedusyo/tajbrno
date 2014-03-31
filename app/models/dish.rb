class Dish < ActiveRecord::Base
  has_and_belongs_to_many :menu_categories
  belongs_to :images
  belongs_to :user

  auto_strip_attributes :name, :description, :price
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    format:   %r{[0-9]+(?:\.[0-9]+)?}

  validates :image, presence: true

  mount_uploader :image, DishImageUploader
end
