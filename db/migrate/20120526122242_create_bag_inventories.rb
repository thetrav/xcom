class CreateBagInventories < ActiveRecord::Migration
  def up
    create_table :bags do |t|
      t.string :name
      t.integer :item_id
      t.integer :player_id
      t.timestamps
    end

    create_table :players do |t|
      t.string :name
      t.timestamps
    end

    add_column :inventories, :player_id, :integer
    add_column :items, :bag_id, :integer
  end

  def down
    drop_column :items, :bag_id
    drop_column :inventories, :player_id

    drop_table :player
    drop_table :bags
  end
end
