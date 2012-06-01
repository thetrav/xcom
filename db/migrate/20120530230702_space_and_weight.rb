class SpaceAndWeight < ActiveRecord::Migration
  def up
    add_column :bags, :capacity, :float
    add_column :items, :space, :float
    add_column :items, :weight, :float
  end

  def down
    drop_column :bags, :capacity
    drop_column :items, :space
    drop_column :items, :weight
  end
end
