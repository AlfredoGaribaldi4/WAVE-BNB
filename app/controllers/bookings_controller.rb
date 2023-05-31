class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit]
  before_action :set_board, only: [:new, :create]

  def index
    @boards = Board.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.board = @board
    @booking.user = current_user
    @booking.total_price = (@booking.date_check_out - @booking.date_check_in) * @board.price_per_day

    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def accept
    @booking = Booking.find(params[:booking_id])
    @booking.confirmed!
    redirect_to bookings_path
  end

  def decline
    @booking = Booking.find(params[:booking_id])
    @booking.declined!
    redirect_to bookings_path
  end

  private


  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def booking_params
    params.require(:booking).permit(:date_check_in, :date_check_out)
  end
end
