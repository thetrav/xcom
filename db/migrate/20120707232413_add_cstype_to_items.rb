class AddCstypeToItems < ActiveRecord::Migration
  def change
    add_column :base_items, :cs_type, :string
  end
end
