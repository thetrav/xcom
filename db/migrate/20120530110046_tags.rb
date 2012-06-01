class Tags < ActiveRecord::Migration
  def up
    add_column :items, :aliases, :text
    add_column :slots, :accepts, :text
    add_column :bags, :accepts, :text
  end

  def down
    drop_column :items, :aliases
    drop_column :slots, :accepts
    drop_column :bags, :accepts
  end
end
