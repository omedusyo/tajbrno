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
                       format:     %r{\A[0-9a-zA-Z_-]+\z},
                       uniqueness: true

  validates :first_name, presence: true,
                         length:   { in: 2..254 },
                         format:   %r{\A[a-zA-Z]+\z}

  validates :last_name, presence: true,
                        length:   { in: 2..254 },
                        format:   %r{[a-zA-Z]+}

  validates :password, presence: true,
                       length: { in: 6..254 },
                       confirmation: true,
                       on: :create

  validates :access_rights, presence: true

  # takes a controller name as an input (as a symbol)
  # and outputs true if the user has rights to the controller
  # else false
  def has_access? c
    access_rights[controller2right c] == '1'
  end

private
  # takes controller name as an input (as a symbol)
  def controller2right c
    {
      articles:     0,
      categories:   1,
      dishes:       1,
      gallery:      2,
      reservations: 3,
      users:        4

    }[c]
  end
end
