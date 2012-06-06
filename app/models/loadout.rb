class Loadout < ActiveRecord::Base
  attr_accessible :player_id, :loadout
  serialize :loadout

  belongs_to :player
end