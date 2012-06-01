class Slot < ActiveRecord::Base
  attr_accessible :name, :item_parent_id, :id, :accepts

  serialize :accepts

  belongs_to :item_parent, :class_name => "Item", :foreign_key => :item_parent_id
  has_one :item, :class_name => "Item", :foreign_key => :slot_parent_id


  def weight
    item.nil? ? 0 : item.total_weight
  end

  def jsonify
    hash = as_json
    hash = hash.merge({:item => item.jsonify}) unless item.nil?
    hash
  end

end