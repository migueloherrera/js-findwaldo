class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    find_board
    @characters = @board.characters
    @start = Time.now.to_i
  end
  
  def read_character
    find_board
    @characters = @board.characters
    render json: @characters
  end
  
  private
    def find_board
      @board = Board.find(params[:id])
    end
end
