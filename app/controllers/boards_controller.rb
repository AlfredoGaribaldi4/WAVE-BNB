class BoardsController < ApplicationController
  before_action :set_boards, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user

    if @board.save
      redirect_to boards_path(@board), notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @board.update(board_params)
    redirect_to board_path(@board)
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

  def set_boards
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:category, :description, :title, :price_per_day, :location)
  end

end
