class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.references :user
			t.references :submission
			t.references :parent_comment, references: :comments 
			t.string :content
			t.integer :vote_count, default: 0	
			t.timestamps
		end
	end
end
