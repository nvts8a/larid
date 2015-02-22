class AddFishDetailsToFish < ActiveRecord::Migration
  def change
    add_column :fish, :catch_time,  :timestamp
    add_column :fish, :latitude,    :decimal
    add_column :fish, :length,      :decimal
    add_column :fish, :longitude,   :decimal
    add_column :fish, :sex,         :string
    add_column :fish, :weight,      :decimal
  end
end
