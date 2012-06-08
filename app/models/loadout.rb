class Loadout < ActiveRecord::Base
  attr_accessible :player_id, :loadout, :name
  serialize :loadout

  belongs_to :player
end