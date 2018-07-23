class RemoveStatusFromSubmission < ActiveRecord::Migration
  def change
    remove_column :submissions, :status
  end
end
