class CreateTables < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.string :name
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

      t.integer :quantity
    end

    create_table :items do |t|
      t.integer :base_item_id
      t.integer :parent_item_id
      t.integer :player_id
    end
  end

  def down
    drop_table :players
    drop_table :items
  end
end
