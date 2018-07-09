class MakeVotePostRefPolymorphic < ActiveRecord::Migration
  	def change
		rename_column :votes, :submission_id, :post_id
		add_column :votes, :post_type, :string
  	end
end
