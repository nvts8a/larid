class ChangeFishermenToUsers < ActiveRecord::Migration
  def change
    rename_table :fishermen, :users
  end
end
