class LoadoutsController < Resty
  def create
    player = Player.find(params[:loadout][:player_id])
    load = Loadout.new(:player_id => player.id)

    load.loadout= copy(player.items)

    load.save!

    render :json => load
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