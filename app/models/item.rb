class Item < ActiveRecord::Base
  attr_accessible :name, :space, :weight, :aliases, :slot_parent_id, :bag_parent_id, :slot_child_id, :bag_child_id

  serialize :aliases

  belongs_to :slot_parent, :class_name => "Slot", :foreign_key => "slot_parent_id"
  belongs_to :bag_parent, :class_name => "Bag", :foreign_key => "bag_parent_id"

  belongs_to :bag_child, :class_name => "Bag", :foreign_key => "bag_child_id"
  has_many :slot_children, :class_name => "Slot", :foreign_key => "item_parent_id"

  def total_weight
    total = weight
    total += slot_children.sum {|it| it.weight}
    total += bag_child.nil? ? 0 : bag_child.weight
    total
  end

  def jsonify
    hash = as_json
    hash.merge!({:total_weight => total_weight})
    hash.merge!({:slot_children => slot_children.map {|it| it.jsonify}})
    hash.merge!({:bag_child => bag_child.jsonify}) unless bag_child.nil?
    hash
  end
end