class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end
  
  def show
  end
  
  def import
  	Team.import(params[:file])
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Successful Upload!' }
      format.json { head :no_content }
    end
  end

  def create
    @team = Team.new(team_params)
  end

  def kill
  	@team = Team.all
    @team.each do |t|
    	t.destroy
    end
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Successful Deletion!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
