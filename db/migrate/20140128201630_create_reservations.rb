class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :reservation_date
      t.string :telephone_number
      t.integer :number_of_people
      t.boolean :allowed
      t.integer :user_id

      t.datetime :created_at
    end
    add_index :reservations, :user_id
  end
end
