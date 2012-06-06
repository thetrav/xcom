class Player < ActiveRecord::Base
  attr_accessible :id, :name, :mount_points, :item_ids, :updated_at, :created_at

  serialize :mount_points

  has_many :items, :class_name => "Item", :foreign_key => "player_id"
  has_many :loudouts

  def weight
    items.sum {|it| it.total_weight}
  end
end