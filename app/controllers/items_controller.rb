class ItemsController < Resty

  def index
    render :json => Item.not_trash.all.sort_by { |it| it.name }
  end

  def trash
    Item.find(params[:id]).update_attributes!(trashed: true)
    render :json => {:message => :success}
  end

  def destroy
    Item.find(params[:id]).destroy
    render :json => {:message => :success}
  end
end