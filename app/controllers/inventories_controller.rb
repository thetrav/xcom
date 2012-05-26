class InventoriesController < ApplicationController
  def index
    top_level_inventories = Inventory.all.reject {|it| !it.item_id.nil?}
    render :json => top_level_inventories.map {|it| it.jsonify}
  end

  def show
    render :json => Inventory.find(params[:id])
  end

  def create
    object = Inventory.create! params[:inventory]
    render :json => object
  end

  def update
    object = Inventory.find(params[:id])
    object.update_attributes! params[:inventory]
    render :json => object
  end
end