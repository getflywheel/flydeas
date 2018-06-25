class AddMoreColumnsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :user_id, :string
    add_column :submissions, :upvotes, :string
    add_column :submissions, :donwvotes, :string
  end
end
