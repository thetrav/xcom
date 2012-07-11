class AddBinnedToItems < ActiveRecord::Migration
  def up
    add_column :items, :trashed, :boolean, :default => false
  end

  def down
    remove_column :items, :trashed
  end
end
