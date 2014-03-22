class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.order 'reservation_date DESC'
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new reservation_params
    if @reservation.save
      flash[:notice] = 'Reservation was made successfully'
      redirect_to controller: :articles, action: :index
    else
      flash[:create_reservation_alerts] = @reservation.errors.full_messages
      render 'new'
    end
  end

private
  def reservation_params
    params.require(:reservation).permit :reservation_date, :telephone_number, :number_of_people
  end
end
