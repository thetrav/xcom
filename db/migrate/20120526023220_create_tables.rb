class CreateTables < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.string :name
      t.text :mount_points
      t.timestamps
    end

    create_table :base_items do |t|
      t.string :name
      t.text :aliases


      t.float :space
      t.float :weight

      t.float :capacity
      t.text :accepts
      t.text :goes_in
      t.text :mount_points

      t.integer :quantity
    end

    create_table :items do |t|
      t.integer :base_item_id
      t.integer :parent_item_id
      t.integer :player_id
      t.string :mount_point
    end

    create_table :loadouts do |t|
      t.integer :player_id
      t.string :name
      t.text :loadout
    end
  end

  def down
    drop_table :players
    drop_table :items
    drop_table :base_items
  end
end
