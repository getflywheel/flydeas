class AddCategoryToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :category, :string
  end
end
