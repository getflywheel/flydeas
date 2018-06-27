class AddVoteCountToSubmission < ActiveRecord::Migration
  def change
   add_column :submissions, :vote_count, :integer, :default => 0 
  end
end
