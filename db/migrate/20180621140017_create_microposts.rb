class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :Submissions
      t.string :title
      t.text :content
      t.string :user_id
      t.string :upvotes
      t.string :donwvotes

      t.timestamps null: false
    end
  end
end
