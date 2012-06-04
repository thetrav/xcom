class BaseInventoryController < ApplicationController
  def index
    @baseItem = BaseItem.new
    @baseItems = BaseItem.all
  end
end