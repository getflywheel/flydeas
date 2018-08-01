class CreateColorTable < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.boolean :used
    end
  end
end
