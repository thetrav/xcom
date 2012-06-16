class AddPlayingToggleToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :playing, :boolean
  end
end
