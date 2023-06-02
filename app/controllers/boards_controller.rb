class BoardsController < ApplicationController
  before_action :set_boards, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @boards = Board.all

    if params[:query].present?
      sql_subquery = <<~SQL
        boards.location @@ :query
      SQL
      @boards = @boards.where(sql_subquery, query: params[:query])
    end

    @markers = @boards.geocoded.map do |board|
      {
        lat: board.latitude,
        lng: board.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { board: }),
        marker_html: render_to_string(partial: "marker")
      }
    end
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
      redirect_to board_path(@board), notice: 'Bookmark was successfully created.'
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
    redirect_to bookings_path
  end

  private

  def set_boards
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:category, :description, :title, :price_per_day, :location, :photo)
  end

end
