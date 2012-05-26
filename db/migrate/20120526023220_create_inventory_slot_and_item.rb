class CreateInventorySlotAndItem < ActiveRecord::Migration
  def up
    create_table :inventories do |t|
      t.string :name
      t.integer :item_id
      t.timestamps
    end

    create_table :slots do |t|
      t.string :name
      t.integer :inventory_id
    end

    create_table :items do |t|
      t.string :name
      t.integer :slot_id
    end
  end

  def down
    drop_table :inventories
    drop_table :slots
    drop_table :items
  end
end
