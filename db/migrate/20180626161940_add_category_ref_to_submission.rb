class AddCategoryRefToSubmission < ActiveRecord::Migration
  def change
    add_reference :submissions, :category, index: true
  end
end
