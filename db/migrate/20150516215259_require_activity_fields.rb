class RequireActivityFields < ActiveRecord::Migration
  def change
    change_column_null :activities, :latitude,  false
    change_column_null :activities, :longitude, false
  end
end
