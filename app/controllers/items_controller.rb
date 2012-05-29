class ItemsController < Resty

  def index
    top_level_inventories = Item.all.reject {|it| !it.slot_id.nil?}
    render :json => top_level_inventories.map {|it| it.jsonify}
  end
end