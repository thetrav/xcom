class AddCsNameToBaseItem < ActiveRecord::Migration
  def change
    add_column :base_items, :cs_name, :string
  end
end
