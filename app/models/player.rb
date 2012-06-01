class Player < ActiveRecord::Base
  attr_accessible :name, :id, :updated_at, :created_at, :inventories, :bags

  has_many :slots
  has_many :bags

  def weight
    (slots.sum {|it| it.weight}) + (bags.sum {|it| it.weight})
  end

  def jsonify
    hash = as_json
    hash.merge!({:weight => weight})
    hash.merge!({:slots => slots.map {|it| it.jsonify}}) unless slots.nil?
    hash.merge!({:bags => bags.map {|it| it.jsonify}}) unless bags.nil?
    hash
  end
end