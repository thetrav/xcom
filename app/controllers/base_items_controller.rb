class BaseItemsController < Resty
  def for_player
    items = BaseItem.all.reject {|it| !it.for_player?}
    render :json => items
  end
end