class ItemsController < Resty

  def destroy
    Item.find(params[:id]).destroy
    render :json => {:message => :success}
  end
end