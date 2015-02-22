class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.belongs_to :fisherman, index: true
      t.string     :species

      t.timestamps null: false
    end
  end
end
