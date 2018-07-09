class DropPostsIfExists < ActiveRecord::Migration
	def change
		drop_table :posts, if_exists: true
	end
end
