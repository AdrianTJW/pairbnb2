class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.new
  end

  def create
    @reservation = current_user.reservations.new(reservations_params)
    @listing = Listing.find(params[:reservation][:listing_id])
    if @reservation.save!
      @customer = @reservation.email
      @host = @reservation.listing.email
      @reservation_id = @reservation.id
      @booking = @reservation.listing.title
      @url = "http://localhost:3000/reservations/#{@reservation.id}"
      ReservationMailer.booking_email(@customer, @host, @reservation_id, @booking, @url).deliver_now
      ReservationMailer.customer_email(@customer, @host, @reservation_id, @booking, @url).deliver_now
      redirect_to '/'
    end
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
    @listing = Listing.find_by(params[:listing_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def reservations_params
    params.require(:reservation).permit(:name, :email, :contact, :startdate, :enddate, :listing_id, :user_id)
  end

  def preload
    @listing = Listing.find(params[:listing_id])
    today = Date.today
    @reservations = @listing.reservations.where("startdate >= ? OR enddate >= ?", today, today)
    render json: @reservations
  end

end
