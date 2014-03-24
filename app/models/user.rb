class User < ActiveRecord::Base
  has_secure_password

  has_many :articles
  has_many :menu_categories
  has_many :menus
  has_many :dishes
  has_many :reservations
  has_many :gallery_images

  auto_strip_attributes :username, :first_name, :last_name

  validates :username, presence:   true,
                       length:     { in: 3..254 },
                       format:     %r{[0-9a-zA-Z_-]+},
                       uniqueness: true

  validates :first_name, presence: true,
                         length:   { in: 2..254 },
                         format:   %r{[a-zA-Z]+}

  validates :last_name, presence: true,
                        length:   { in: 2..254 },
                        format:   %r{[a-zA-Z]+}

  validates :password, presence: true,
                       length:   { in: 6..254 }
  # validates :access_rights, presence: true
end
