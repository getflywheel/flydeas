class AddFistLastName < ActiveRecord::Migration
  def change
	unless column_exists? :users, :first_name
    	add_column :users, :first_name, :string
	end
   	unless column_exists? :users, :last_name 
		add_column :users, :last_name, :string
	end
  end
end

