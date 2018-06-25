class RecreateSubmissionsTable < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.timestamps null:false
    end
    add_column :submissions, :title, :string
    add_column :submissions, :content, :string
    add_column :submissions, :category, :string
    add_column :submissions, :username, :string
  end
end
