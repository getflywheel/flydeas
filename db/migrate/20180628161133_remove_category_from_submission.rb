class RemoveCategoryFromSubmission < ActiveRecord::Migration
  def change
   remove_column :submissions, :category 
  end
end
