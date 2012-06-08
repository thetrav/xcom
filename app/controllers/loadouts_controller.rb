class LoadoutsController < Resty
  def create
    player = Player.find(params[:loadout][:player_id])
    load = Loadout.new(:player_id => player.id, :name => params[:loadout][:name])

    load.loadout= copy(player.items)

    load.save!

    render :json => load
  end

  def apply
    load = Loadout.find(params[:id])
    player = load.player
    player.items.each {|it| it.destroy}
    load.items.each {|it| player.items << it}
    player.save!
    redirect_to :controller => :page_controller, :action => :index
  end

  private

  def copy(itemList)
    itemList.map do |item|
      item_copy = item.dup
      item_copy.items = copy(item.items)
      item_copy
    end
  end
end