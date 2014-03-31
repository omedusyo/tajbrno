class Reservation < ActiveRecord::Base
  belongs_to :user

  auto_strip_attributes :reservation_date, :telephone_number, :number_of_people
  validates :reservation_date, presence: true
  validates :telephone_number, presence: true,
                               format: %r{\A[0-9]{3}-[0-9]{3}-[0-9]{3}\z}
  validates :number_of_people, presence: true

  validates_date :reservation_date, after: :today
end
