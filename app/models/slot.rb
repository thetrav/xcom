class Slot < ActiveRecord::Base
  attr_accessible :name, :inventory_id, :id, :accepts

  serialize :accepts

  belongs_to :inventory

  has_one :item

  def jsonify
    hash = as_json
    hash = hash.merge({:item => item.jsonify}) unless item.nil?
    hash
  end

end