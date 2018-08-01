class CreatePostChangeObject < ActiveRecord::Migration
	def change
		create_table :post_changes do |t|
			t.references :submission
			t.integer :change_object_id
			t.string :change_object_type
			t.integer :post_change_type
			t.timestamps
		end
	end
end
