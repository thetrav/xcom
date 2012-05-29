class Item < ActiveRecord::Base
  attr_accessible :name, :slot_id

  belongs_to :slot
  belongs_to :bag

  has_one :inventory
  #has_one :bag

  def jsonify
    hash = as_json
    hash = hash.merge({:inventory => inventory.jsonify}) unless inventory.nil?
    #hash = hash.merge({:bag => bag.jsonify}) unless bag.nil?
    hash
  end
end