class AddCategoryToSubmissions < ActiveRecord::Migration
  def change
    add_reference :submissions, :category, index: true, foreign_key: true
  end
end
