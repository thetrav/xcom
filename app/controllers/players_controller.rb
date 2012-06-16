class PlayersController < Resty
  def index
    render :json => Player.where(:playing=>true)
  end
end
