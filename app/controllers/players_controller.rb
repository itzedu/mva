class PlayersController < ApplicationController
  before_action :require_login
  
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    player = Player.new(player_params)
    if player.save
      redirect_to :root
    else
      flash[:errors] = player.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    if player.update(player_params)
      redirect_to :root
    else
      flash[:errors] = player.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    redirect_to :root
  end

private
  def player_params
    params.require(:player).permit(:first_name, :last_name)
  end
end
