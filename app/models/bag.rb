class Bag < ActiveRecord::Base
  attr_accessible :name, :capacity, :accepts, :item_id, :player_id, :items, :id, :updated_at, :created_at

  serialize :accepts

  belongs_to :player

  has_one :item_parent, :class_name => "Item", :foreign_key => :bag_child_id
  has_many :items, :class_name => "Item", :foreign_key => :bag_parent_id

  def used_capacity
    items.sum{|it| it.space}
  end

  def weight
    items.sum{|it|it.total_weight}
  end

  def jsonify
    hash = as_json
    hash.merge!({:used_capacity => used_capacity})
    hash.merge!({:items => items.map {|it| it.jsonify}}) unless items.nil?
    hash
  end
end