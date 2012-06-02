class Item < ActiveRecord::Base
  attr_accessible :base_item_id, :parent_item_id, :player_id

  belongs_to :base_item

  belongs_to :parent, :class_name => "Item", :foreign_key => "parent_item_id"
  belongs_to :player, :class_name => "Player", :foreign_key => "player_id"

  has_many :items, :class_name => "Item", :foreign_key => "parent_item_id"

  delegate :weight, :to => :base_item
  delegate :name, :to => :base_item
  delegate :space, :to => :base_item
  delegate :capacity, :to => :base_item
  delegate :accepts, :to => :base_item
  delegate :aliases, :to => :base_item
  delegate :goes_in, :to => :base_item

  def total_weight
    total = weight
    total += items.sum {|it| it.total_weight}
    total
    end
end