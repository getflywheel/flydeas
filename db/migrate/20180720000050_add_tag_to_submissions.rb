class AddTagToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :status, :string
  end
end
