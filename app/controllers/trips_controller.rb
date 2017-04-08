class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.rider_id = params[:rider_id]
    @trip.driver_id = Driver.random_driver_id
    if @trip.save
      redirect_to rider_path(@trip.rider.id)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def complete_trip
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    data = trip_params
    puts data.to_hash
    trip.update!(trip_params)
    result = trip.save
    puts result
    puts trip.errors.messages
    redirect_to rider_path(params[:rider_id])
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to trips_path
  end



# PRIVATE
  private

  def trip_params
    params.require(:trip).permit(:passenger_id , :driver_id , :date , :rating, :fare )
  end
  
end #END of class TripsController
