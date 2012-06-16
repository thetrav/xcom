class BaseInventoryController < ApplicationController
  before_filter :authenticate_player!
  def index
    @baseItem = BaseItem.new
    @baseItems = BaseItem.all
  end
end