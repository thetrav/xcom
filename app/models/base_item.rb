#items inside the base, not some technical meaning
class BaseItem < ActiveRecord::Base
  attr_accessible :name, :space, :weight, :capacity, :quantity,
                  :aliases, :accepts, :goes_in

  serialize :aliases
  serialize :accepts
  serialize :goes_in

  def for_player?
    return false if goes_in.nil?
    goes_in.include?("player")
  end

  def for_item?(item)
    if !goes_in.nil?
      return true if goes_in == "all" || goes_in.include?(item.name)
      return true if in_both_lists(item.aliases, goes_in)
    end
    return false if item.accepts.nil?
    return true if item.accepts.include?("all") || item.accepts.include?(name)
    return true if in_both_lists(item.accepts, aliases)
    false
  end

  private

  def in_both_lists(a, b)
    return false if a.nil? || b.nil?
    match = false
    a.each {|it| match ||= b.include?(it)}
    match
  end
end