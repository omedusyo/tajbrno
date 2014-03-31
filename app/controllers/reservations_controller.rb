class ReservationsController < ApplicationController
  before_action :do_authentication,
                only: [ :index, :allow, :destroy ]

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
      acknowledge_errors @reservation
      render 'new'
    end
  end

  def allow
    @reservation = Reservation.find params[:id]
    if @reservation.update_attributes allowed: true, user_id: current_user.id
      flash[:notice] = 'You allowed a reservation'
    else
      acknowledge_errors @reservation
    end
    redirect_to action: :index
  end

  def destroy
    Reservation.find(params[:id]).destroy
      flash[:notice] = 'You destroyed a reservation'
    redirect_to action: :index
  end

private
  def reservation_params
    params.require(:reservation).permit :reservation_date, :telephone_number, :number_of_people
  end
end
