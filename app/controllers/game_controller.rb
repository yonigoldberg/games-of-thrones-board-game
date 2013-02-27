class GameController < ApplicationController

  def index
    @games = Game.all
  end


  def show
    game_name = params[:name]
    @game = Game.find_by_name(game_name)
    redirect_to "/" if (@game.blank?)
  end

  def new_game
    name =  params[:name]
    Game.create(:name => name)
    redirect_to "/game/#{name}"
  end
end
