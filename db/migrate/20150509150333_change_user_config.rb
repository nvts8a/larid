class ChangeUserConfig < ActiveRecord::Migration
  def change
    change_column_null :users, :email,    false
    change_column_null :users, :password, false
    add_index :users, :email, unique: true
    add_index :users, :password
  end
end
