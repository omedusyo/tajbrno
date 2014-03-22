class User < ActiveRecord::Base
  has_secure_password

  has_many :articles
  has_many :menu_categories
  has_many :menus
  has_many :dishes
  has_many :reservations
  has_many :gallery_images

  validates :username, presence:   true,
                       length:     { in: 1..254 },
                       format:     %r{[a-zA-Z_-]+},
                       uniqueness: true

  validates :first_name, presence: true,
                         length:   { in: 1..254 }

  validates :last_name, presence: true,
                        length:   { in: 1..254 }

  # validates :access_rights, presence: true
end
