class ChangeUserColName < ActiveRecord::Migration
  def change
    rename_column :submissions, :username, :user_id
  end
end
