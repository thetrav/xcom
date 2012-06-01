class CreateTables < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.string :name
      t.timestamps
    end

    create_table :bags do |t|
      t.string :name
      t.float :capacity
      t.text :accepts
      t.integer :player_id
      t.timestamps
    end

    create_table :slots do |t|
      t.string :name
      t.text :accepts
      t.integer :player_id
      t.integer :item_parent_id
      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.text :aliases

      t.float :space
      t.float :weight

      t.integer :slot_parent_id
      t.integer :bag_parent_id
      t.integer :bag_child_id
    end
  end

  def down
    drop_table :players
    drop_table :bags
    drop_table :slots
    drop_table :items
  end
end
