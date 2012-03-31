class AddIndexToUsersCardnumber < ActiveRecord::Migration
  def change
    add_index :users, :cardnumber, unique: true
  end
end
