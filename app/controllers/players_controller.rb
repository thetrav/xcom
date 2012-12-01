class PlayersController < Resty
  def index
    render :json => Player.where(:playing=>true).order(:name)
  end
end
