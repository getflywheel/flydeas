class CreateNotification < ActiveRecord::Migration
	def change
		create_table :notifications do |t|
			t.references :user
			t.references :post_change
			t.timestamps
		end
	end
end
