class Player < ActiveRecord::Base
  attr_accessible :id, :name, :item_ids, :updated_at, :created_at

  has_many :items, :class_name => "Item", :foreign_key => "player_id"

  def weight
    items.sum {|it| it.total_weight}
  end
end