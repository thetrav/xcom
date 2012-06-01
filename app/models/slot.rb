class Slot < ActiveRecord::Base
  attr_accessible :name, :inventory_id, :id, :accepts

  serialize :accepts

  belongs_to :inventory

  has_one :item

  def weight
    item.nil? ? 0 : item.total_weight
  end

  def jsonify
    hash = as_json
    hash = hash.merge({:item => item.jsonify}) unless item.nil?
    hash
  end

end