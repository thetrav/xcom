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
end