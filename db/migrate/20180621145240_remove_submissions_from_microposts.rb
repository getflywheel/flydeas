class RemoveSubmissionsFromMicroposts < ActiveRecord::Migration
  def change
    remove_column :microposts, :Submissions, :string
  end
end
