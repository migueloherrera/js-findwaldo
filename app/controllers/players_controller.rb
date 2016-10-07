class PlayersController < ApplicationController
  
  def index
    search_players(params[:board_id])
    @start = Time.now.to_i - params[:start].to_i
  end

  def create
    @player = Player.new(player_params)
    if @player.save 
      search_players(@player.board_id)
      render :index
    else
      redirect_to root_path
    end
  end
  
  private
    def player_params
      params.require(:player).permit(:name, :score, :board_id)
    end
    
    def search_players(board)
      @board = Board.find(board)
      @players = @board.players.order('score asc').limit(20)
      @scores = @players.map { |p| p.score }
    end
  
end
