class Player < ActiveRecord::Base
  attr_accessible :name, :id, :updated_at, :created_at, :inventories, :bags

  has_many :inventories
  has_many :bags

  def weight
    (inventories.sum {|it| it.weight}) + (bags.sum {|it| it.weight})

  end

  def jsonify
    hash = as_json
    hash.merge!({:weight => weight})
    hash.merge!({:inventories => inventories.map {|it| it.jsonify}}) unless inventories.nil?
    hash.merge!({:bags => bags.map {|it| it.jsonify}}) unless inventories.nil?
    hash
  end
end