class MakeUserAccesRightsAString < ActiveRecord::Migration
  def up
    change_column :users, :access_rights, :string
  end

  def down
    change_column :users, :access_rights, :integer
  end
end
