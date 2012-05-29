class Bag < ActiveRecord::Base
  attr_accessible :name, :item_id, :player_id, :items, :id, :updated_at, :created_at

  belongs_to :item
  belongs_to :player

  has_many :items

  def jsonify
    hash = as_json
    hash = hash.merge({:items => items.map {|it| it.jsonify}}) unless items.nil?
    hash
  end
end