class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit]

  def index
    @bookings = Booking.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end