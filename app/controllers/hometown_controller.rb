class HometownController < ApplicationController
  def index
  	@players = Player.where("state = ?", params[:id]).order("pos")
  end

  def show
  	@players = Player.where("city = ?", params[:id]).order("pos")
  end
end
