#items inside the base, not some technical meaning
class BaseItem < ActiveRecord::Base
  before_destroy :destroy_items

  attr_accessible :name, :space, :weight, :capacity, :quantity,
                  :aliases, :accepts, :goes_in, :mount_points, :cs_type

  serialize :aliases, JSON
  serialize :accepts, JSON
  serialize :goes_in, JSON
  serialize :mount_points, JSON

  def for_player?(mountpoint)
    return false if goes_in.nil?
    goes_in.include?("Player")
  end

  def for_item?(item)
    if !goes_in.blank?
      return true if goes_in == "all" || goes_in.include?(item.name)
      return true if in_both_lists(item.aliases, goes_in)
    end
    return false if item.accepts.blank?
    return true if item.accepts.include?("all") || item.accepts.include?(name)
    return true if in_both_lists(item.accepts, aliases)
    false
  end

  private

  def destroy_items
    Item.find_all_by_base_item_id(id).each{|it|it.destroy}
  end

  def in_both_lists(a, b)
    return false if a.blank? || b.blank?
    match = false
    a.each {|it| match ||= b.include?(it)}
    match
  end
end