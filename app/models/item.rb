class Item < ActiveRecord::Base
  before_create :subtract_inventory
  before_destroy :return_to_inventory

  scope(:not_trash, where(:trashed => false))

  attr_accessible :base_item_id, :parent_item_id, :player_id, :mount_point, :trashed

  belongs_to :base_item

  belongs_to :parent, :class_name => "Item", :foreign_key => "parent_item_id"
  belongs_to :player, :class_name => "Player", :foreign_key => "player_id"

  has_many :items, :class_name => "Item", :foreign_key => "parent_item_id", :dependent => :destroy, :autosave => true

  delegate :weight, :to => :base_item
  delegate :name, :to => :base_item
  delegate :space, :to => :base_item
  delegate :capacity, :to => :base_item
  delegate :accepts, :to => :base_item
  delegate :aliases, :to => :base_item
  delegate :goes_in, :to => :base_item
  delegate :mount_points, :to => :base_item
  delegate :cs_type, :to => :base_item
  delegate :cs_name, :to => :base_item

  def total_weight
    total = weight
    total += items.sum {|it| it.total_weight}
    total
  end

  def subtract_inventory
    base_item.quantity -= 1
    base_item.save!
  end

  def return_to_inventory
    base_item.quantity += 1
    base_item.save!
  end
end