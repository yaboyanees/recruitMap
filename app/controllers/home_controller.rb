class HomeController < ApplicationController
  def index
  	@teams = Player.uniq.pluck("team")
  	@notNull = Player.where("hometown IS NOT NULL")
  	
	@homeState = @notNull.group("state").limit(25).order("count_state DESC").count("state")
	@homeCity = @notNull.group("city").limit(25).order("count_city DESC").count("city")

	@pos = @notNull.uniq.pluck("pos")
  end

  def show
  	@players = Player.where("team = ?", params[:id])
  	@playerList = @players.order("pos ASC")
  end
end
