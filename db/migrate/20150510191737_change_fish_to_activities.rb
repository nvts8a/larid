class ChangeFishToActivities < ActiveRecord::Migration
  def change
    remove_column :fish, :species
    remove_column :fish, :catch_time
    remove_column :fish, :length
    remove_column :fish, :sex
    remove_column :fish, :weight
    
    rename_column :fish, :fisherman_id, :user_id
    rename_table :fish, :activities
  end
end
