class Player < ActiveRecord::Base
  attr_accessible :name, :id, :updated_at, :created_at, :inventories, :bags

  has_many :inventories
  has_many :bags

  def jsonify
    hash = as_json
    hash = hash.merge({:inventories => inventories.map {|it| it.jsonify}}) unless inventories.nil?
    hash = hash.merge({:bags => bags.map {|it| it.jsonify}}) unless inventories.nil?
    hash
  end
end