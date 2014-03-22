class MenuCategory < ActiveRecord::Base
  has_and_belongs_to_many :dishes
  belongs_to :user
end
