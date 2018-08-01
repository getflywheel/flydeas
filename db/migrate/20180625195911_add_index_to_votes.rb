class AddIndexToVotes < ActiveRecord::Migration
  def change
	add_column :votes, :user_id, :integer unless column_exists? :votes, :user_id
    add_index(:votes, [:user_id, :submission_id], unique: true)
  end
end
