class AddSubmissions < ActiveRecord::Migration
  def change
    drop_table :submissions
  end
end
