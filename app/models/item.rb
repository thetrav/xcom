class Item < ActiveRecord::Base
  attr_accessible :name, :space, :weight, :slot_id, :bag_id, :aliases

  serialize :aliases

  belongs_to :slot
  belongs_to :bag

  has_one :bag_child, :class_name => "Bag", :foreign_key => "item_id"
  has_one :inventory

  def total_weight
    total = weight
    total += inventory.nil? ? 0 : inventory.weight
    total += bag_child.nil? ? 0 : bag_child.weight
    total
  end

  def jsonify
    hash = as_json
    hash.merge!({:total_weight => total_weight})
    hash.merge!({:inventory => inventory.jsonify}) unless inventory.nil?
    hash.merge!({:bag_child => bag_child.jsonify}) unless bag_child.nil?
    hash
  end
end