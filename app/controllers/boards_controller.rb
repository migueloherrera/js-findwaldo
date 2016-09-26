class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    find_board
    @characters = @board.characters
  end
  
  private
    def find_board
      @board = Board.find(params[:id])
    end
end
