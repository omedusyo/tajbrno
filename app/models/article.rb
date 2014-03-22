class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true,
                    length: { minimum: 2 }

  validates :content, presence: true
  # validates :user_id, presence: true
end
