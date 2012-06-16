class AddEncumberance < ActiveRecord::Migration
  def change
    add_column :players, :basic_lift, :float
    add_column :players, :basic_move, :float
    add_column :players, :dodge, :float
  end
end
