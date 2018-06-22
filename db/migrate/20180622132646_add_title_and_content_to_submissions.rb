class AddTitleAndContentToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :title, :string
    add_column :submissions, :content, :string
  end
end
