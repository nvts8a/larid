class RequireActivityUserId < ActiveRecord::Migration
  def change
    change_column_null :activities, :user_id,  false
  end
end
