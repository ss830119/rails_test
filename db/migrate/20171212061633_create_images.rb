class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :item_type
      t.integer :item_id

      t.string :file
      t.integer :priority, default: 0

      t.datetime :deleted_at

      t.timestamps
    end
    add_index :images, :item_type
    add_index :images, :item_id 
  end
end
