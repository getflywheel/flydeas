class CreateStatusTableAddRefernce < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      
      t.timestamps null: false
    end
    add_index :statuses, :name
    add_reference :submissions, :status, index: true
  end
end
