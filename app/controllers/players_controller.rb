class PlayersController < ApplicationController
  def index
    @players = Player.count
  end

  def import
  	Player.import(params[:file])
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Successful Upload!' }
      format.json { head :no_content }
    end
  end
  
  def show
  	@pos = Player.select("pos", "name", "hometown", "team")
	@players = @pos.where("pos = ?", params[:id])
  end
  
  def create
    @players = @player.count
  end

  def kill
  	@player = Player.all
    @player.each do |t|
    	t.destroy
    end
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Successful Deletion!' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :pos, :hometown, :city, :state, :latitude, :longitude, :team)
    end
end
