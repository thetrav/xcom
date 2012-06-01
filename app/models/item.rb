class Item < ActiveRecord::Base
  attr_accessible :name, :space, :weight, :slot_id, :bag_id, :aliases

  serialize :aliases

  belongs_to :slot
  belongs_to :bag

  has_one :bag_child, :class_name => "Bag", :foreign_key => "item_id"
  has_one :inventory

  def jsonify
    hash = as_json
    hash = hash.merge({:inventory => inventory.jsonify}) unless inventory.nil?
    hash = hash.merge({:bag_child => bag_child.jsonify}) unless bag_child.nil?
    hash
  end
end