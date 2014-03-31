class Article < ActiveRecord::Base
  belongs_to :user

  auto_strip_attributes :title, :content
  validates :title,   presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
