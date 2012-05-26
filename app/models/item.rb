class Item < ActiveRecord::Base
  attr_accessible :name, :slot_id

  belongs_to :slot

  has_one :inventory

  def jsonify
    hash = as_json
    hash = hash.merge({:inventory => inventory.jsonify}) unless inventory.nil?
    hash
  end
end