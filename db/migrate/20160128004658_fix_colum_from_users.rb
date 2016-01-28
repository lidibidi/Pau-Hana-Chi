class FixColumFromUsers < ActiveRecord::Migration
  def change
    rename_column :users, :first_name, :user_name
  end
end
