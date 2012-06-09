class Loadout < ActiveRecord::Base
  attr_accessible :player_id, :loadout, :name

  serialize :loadout, JSON

  belongs_to :player

  def store_items(top_level)
    top_level.map do |item|
      jsonify(item)
    end
  end

  def jsonify(item)
    hash = item.as_json
    hash[:items] = item.items.map {|it| jsonify(it)} unless item.items.nil?
    hash
  end

  def apply
    player.items.each {|it| it.destroy }
    loadout.each do |it|
      item = Item.create(:player_id => player.id,
                         :base_item_id => it["base_item_id"],
                         :mount_point => it["mount_point"])
      thaw(item, it["items"])
    end
  end

  def thaw(parent, items)
    items.each do |it|
      item = Item.create(:parent_item_id => parent.id,
                         :base_item_id => it["base_item_id"],
                         :mount_point => it["mount_point"])
      thaw(item, it["items"])
    end
  end
end