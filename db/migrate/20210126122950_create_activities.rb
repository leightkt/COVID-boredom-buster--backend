class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.float :accessibility
      t.string :type
      t.integer :participants
      t.float :price
      t.integer :key

      t.timestamps
    end
  end
end
