class RemoveCategoryFromSubmissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :category_id
  end
end
