class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]


  def index
    @players = Player.all
  end

  def show
  end

  def import
  	Player.import(params[:file])
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Successful Upload!' }
      format.json { head :no_content }
    end
  end
  
  def create
    @player = Player.new(player_params)
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
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :pos, :hometown, :latitude, :longitude, :team_id)
    end
end
