class Bag < ActiveRecord::Base
  attr_accessible :name, :item_id, :player_id, :slots, :id, :updated_at, :created_at

  belongs_to :item
  belongs_to :player

  has_many :slots
  accepts_nested_attributes_for :slots

  def jsonify
    hash = as_json
    hash = hash.merge({:slots => slots.map {|it| it.jsonify}}) unless slots.nil?
    hash
  end
end