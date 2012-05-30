class Tags < ActiveRecord::Migration
  def up
    add_column :items, :aliases, :text
    add_column :slots, :accepts, :text
  end

  def down
    drop_column :items, :aliases
    drop_column :slots, :accepts
  end
end
