class RemoveIndexVotesOnUserIdAndPostId < ActiveRecord::Migration
  def change
    remove_index :votes, [:user_id, :post_id] if index_exists?(:votes, [:user_id, :post_id])
  end
end
