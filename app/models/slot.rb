class Slot < ActiveRecord::Base
  attr_accessible :name, :inventory_id, :id, :accepts

  serialize :accepts

  belongs_to :inventory

  has_one :item

  def weight
    if item
      item.weight
    else
      0
    end
  end

  def jsonify
    hash = as_json
    hash = hash.merge({:item => item.jsonify}) unless item.nil?
    hash
  end

end