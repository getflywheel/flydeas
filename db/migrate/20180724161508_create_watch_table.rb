class CreateWatchTable < ActiveRecord::Migration
  def change
    create_table :watches, id: false do |t|
		t.references :user, index: true
		t.references :submission, index: true
    end
  end
end
