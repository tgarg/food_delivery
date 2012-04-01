class RemoveColumnNetidFromUsers < ActiveRecord::Migration
	def change
		remove_index :users, :netid
		remove_column :users, :netid
	end
end
