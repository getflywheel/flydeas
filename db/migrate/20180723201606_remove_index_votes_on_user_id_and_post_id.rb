class RemoveIndexVotesOnUserIdAndPostId < ActiveRecord::Migration
  def change
    remove_index :votes, [:user_id, :post_id]
  end
end
