class Slot < ActiveRecord::Base
  attr_accessible :name, :inventory_id, :item

  belongs_to :inventory

  has_one :item
  accepts_nested_attributes_for :item

  def jsonify
    hash = as_json
    hash = hash.merge({:item => item.jsonify}) unless item.nil?
    hash
  end
end