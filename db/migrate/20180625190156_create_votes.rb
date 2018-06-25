class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :submission
      t.integer :weight, null:false, default:1
      
    end
    #add_index :user_id, :submission_id, unique: true
  end
end
