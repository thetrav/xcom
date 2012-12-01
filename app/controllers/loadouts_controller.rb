class LoadoutsController < Resty
  def create
    player = Player.find(params[:loadout][:player_id])
    load = Loadout.find_by_name(params[:loadout][:name])
    load = Loadout.create(:player_id => player.id, :name => params[:loadout][:name]) if load.nil?

    load.loadout = load.store_items(player.items)
    load.save!

    render :json => load
  end

  def apply
    Loadout.find(params[:id]).apply
    redirect_to "/"
  end

  private

end