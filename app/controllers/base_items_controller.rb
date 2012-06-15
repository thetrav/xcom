class BaseItemsController < Resty
  def for_player
    items = BaseItem.all.reject {|it| !it.for_player?(params[:mountpoint])}
    render :json => items
  end

  def for_item
    items = BaseItem.all.reject {|it| !it.for_item?(Item.find(params[:item]))}
    render :json => items
  end

  def destroy
    BaseItem.find(params[:id]).destroy
    render :json => {:message => :success}
  end
end